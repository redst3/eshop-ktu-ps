
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using persuasiveAPI.Auth;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI.Controllers;
[ApiController]
[Route("/api/backgroundimages")]
public class BackgroundImageController: ControllerBase
{
    private readonly IBackgroundImageRepository _backgroundImageRepository;
    private readonly IJwtTokenService _jwtTokenService;
    public BackgroundImageController(IBackgroundImageRepository backgroundImageRepository, IJwtTokenService jwtTokenService)
    {
        _backgroundImageRepository = backgroundImageRepository;
        _jwtTokenService = jwtTokenService;
    }
    [HttpGet]
    [Route("{userId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> GetBackgroundImage(string userId)
    {
        try
        {
            var token = Request.Headers["Authorization"].ToString().Substring(7);
            var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
            if (!isValid)
                return Unauthorized("Requested user id does not match token");
        }
        catch{}
        
        var background = await _backgroundImageRepository.GetBackgroundByUserId(userId);
        if(background.ImageUrl == null)
        {
            return NoContent();
        }
        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", background.ImageUrl);
        try {
            byte[] fileBytes = System.IO.File.ReadAllBytes(filePath);
            var extension = Path.GetExtension(filePath);
            var result = new {
            image = File(fileBytes, "image/" + extension.Substring(1)),
            px_to_cm = background.px_to_cm
            };

            return Ok(result);
        }catch {
            return NotFound("Reading file failed");
        }
    }
    [HttpPost]
    [Route("{userId}")]
    [Authorize(Roles = UserRoles.User)]
    public async Task<IActionResult> ImportBackgroundImage(string userId, [FromForm] IFormFile? background,[FromForm] double px_to_cm)
    {
        try
        {
            var token = Request.Headers["Authorization"].ToString().Substring(7);
            var isValid = _jwtTokenService.CheckAccessTokenWithUserId(token, userId);
            if (!isValid)
                return Unauthorized("Requested user id does not match token");
        }
        catch{}
        
        if(userId == null || px_to_cm == 0){
            return BadRequest("no userId or px_to_cm");
        }
        var backgroundImage = await _backgroundImageRepository.GetBackgroundByUserId(userId);
        if(background != null){
            var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "backgrounds");
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            var extension = Path.GetExtension(background.FileName);
            var filePath = Path.Combine(path, "background_"+ userId + extension);
            backgroundImage.ImageUrl = "images/backgrounds/background_"+ userId + extension;
            backgroundImage.px_to_cm = px_to_cm;
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await background.CopyToAsync(stream);
            }
            await _backgroundImageRepository.UpdateBackgroundImage(backgroundImage);
        } else{

            backgroundImage.px_to_cm = px_to_cm;
            await _backgroundImageRepository.UpdateBackgroundImage(backgroundImage);
        }
        return Ok("Background information updated");
    }
}