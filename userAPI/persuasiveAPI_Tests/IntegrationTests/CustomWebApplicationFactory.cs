using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using persuasiveAPI.Data.Repositories;

namespace persuasiveAPI_Tests.IntegrationTests;

public class CustomWebApplicationFactory : WebApplicationFactory<Program>
{
    public Mock<IWishlistRepository> _wishlistRepository { get; set; }
    public CustomWebApplicationFactory()
    {
        _wishlistRepository = new Mock<IWishlistRepository>();
    }

    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        base.ConfigureWebHost(builder);
        builder.ConfigureTestServices(services =>
            {
                services.AddSingleton(_wishlistRepository.Object);
            }
        );
        
}
}