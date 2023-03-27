
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
    public BackgroundImageController(IBackgroundImageRepository backgroundImageRepository)
    {
        _backgroundImageRepository = backgroundImageRepository;
    }
    [HttpGet]
    [Route("{userId}")]
    public async Task<IActionResult> GetBackgroundImage(string userId)
    {
        var background = await _backgroundImageRepository.GetBackgroundByUserId(userId);
        return Ok(background);
    }
    [HttpPut]
    [Route("{userId}")]
    public async Task<IActionResult> SetBackgroundImage(string userId, string imageUrl, double px_to_cm)
    {
        var background = await _backgroundImageRepository.GetBackgroundByUserId(userId);
        background.ImageUrl = imageUrl;
        background.px_to_cm = px_to_cm;
        await _backgroundImageRepository.UpdateBackgroundImage(background);
        return Ok(background);
    }
}