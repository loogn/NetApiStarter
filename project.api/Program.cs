using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;

namespace project.api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
            
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
            
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseConfiguration(new ConfigurationBuilder().SetBasePath(Environment.CurrentDirectory).AddJsonFile("appsettings.json").Build());

                    webBuilder.UseStartup<Startup>();

                    webBuilder.UseSerilog((whbContext, configureLogger) =>
                    {
                        configureLogger.ReadFrom.Configuration(whbContext.Configuration);
                    });
                });
    }
}
