using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Laborer
{
    public class Laborer
    {
        private TimeSpan clockCycle = TimeSpan.FromSeconds(2);
        private HttpClient callbackClient = new HttpClient();
        private bool stop = false;

        public void StartLabor()
        {
            Console.WriteLine("StartLabor");
            int iteration = 1;
            while(!stop)
            {
                Console.WriteLine($"Iteration{iteration++}");
                var contract = Db.Contract;
                if (contract?.CallbackUrl != null)
                {
                    Console.WriteLine("Calling assignment");
                    try
                    {
                        callbackClient.PostAsync(contract.CallbackUrl, null as HttpContent).Wait();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                }
                Thread.Sleep(clockCycle);
            }
        }
    }
}
