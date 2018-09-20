using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Laborer
{
    public static class Db
    {
        private static object lockObj = new object();
        private static Contract contract;

        public static Contract Contract
        {
            get
            {
                lock (lockObj)
                {
                    return contract;
                }
            }
            set
            {
                lock (lockObj)
                {
                    contract = value;
                }
            }
        }
    }
}
