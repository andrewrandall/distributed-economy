using System;
using System.IO;

namespace Laborer
{
    class Program
    {
        static void Main(string[] args)
        {
            Directory.CreateDirectory("/logs");
            File.WriteAllText("/logs/hello.log", "hello");
            Console.WriteLine(File.ReadAllText("/logs/hello.log"));
        }
    }
}
