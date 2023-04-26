using System.Net;
using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using persuasiveAPI.Controllers;
using persuasiveAPI.Data.Entities;

namespace persuasiveAPI_Tests.IntegrationTests.ControllerTests;

[TestClass]
public class WishlistControllerTests : IDisposable
{
    private CustomWebApplicationFactory _factory;
    private HttpClient _client;
    private Fixture _fixture;

    public WishlistControllerTests()
    {
        _fixture = new Fixture();
        _factory = new CustomWebApplicationFactory();
        _client = _factory.CreateClient();
    }
    public async Task WishlistController_GetWishlist_ReturnOK()
    {
        var result = await _client.GetAsync("api/wishlists/1");
        Assert.AreEqual(HttpStatusCode.OK, result.StatusCode);
    }
    public void Dispose()
    {
        _factory.Dispose();
        _client.Dispose();
    }
}