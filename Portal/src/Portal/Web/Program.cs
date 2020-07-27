using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using CoherentSolutions.Extensions.Hosting.ServiceFabric;

namespace Web
{
    public class Program
    {
        public static void Main(string[] args)
        {
            new HostBuilder()
                /*
                    Define stateless service
                */
                .DefineStatelessService(
                    serviceBuilder =>
                    {
                        serviceBuilder
                            /*
                                Set name of service type defined in PackageRoot/ServiceManifest.xml
                            */
                            .UseServiceType("WebType")
                            /*
                                Define aspnetcore listener
                            */
                            .DefineAspNetCoreListener(
                                listenerBuilder =>
                                {
                                    listenerBuilder
                                        /*
                                            Set name of the endpoint defined in PackageRoot/ServiceManifest.xml
                                        */
                                        .UseEndpoint("ServiceEndpoint")
                                        /*
                                            Use unique service URL integration
                                        */
                                        .UseUniqueServiceUrlIntegration()
                                        .ConfigureWebHost(webHostBuilder => { webHostBuilder.UseStartup<Startup>(); });
                                });
                    })
                .Build()
                .Run();
        }
    }
}
