using System;
using System.Collections.ObjectModel;
using System.Management.Automation.Runspaces;
using System.Management.Automation;

internal class Program
{
    private static void Main(string[] args)
    {
        var sessionState = InitialSessionState.CreateDefault();

        var authorizationManager = new AuthorizationManager("");
        sessionState.AuthorizationManager = authorizationManager;

        using (var psRunspace = RunspaceFactory.CreateRunspace(sessionState))
        {
            psRunspace.Open();

            using (PowerShell ps = PowerShell.Create(psRunspace))
            {
                ps.AddScript("Set-ExecutionPolicy RemoteSigned -Scope CurrentUser ");
                ps.AddScript(@".\getSecret.ps1");

                Collection<PSObject> results = ps.Invoke();
                

                if (ps.Streams.Error != null && ps.Streams.Error.Count > 0)
                {

                    foreach (var err in ps.Streams.Error)
                    {
                        Console.WriteLine(err.ErrorDetails);
                    }
                }
                else
                {
                    foreach (var r in results)
                    {
                        Console.WriteLine(r);
                    }
                    Console.ReadLine();
                }
            }

        }
    }
}