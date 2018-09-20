using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MetalMine
{
    public static class Db
    {
        private static object lockObj = new object();
        private static int onHand = 0;

        public static int OnHand
        {
            get
            {
                lock (lockObj)
                {
                    return onHand;
                }
            }
            set
            {
                lock (lockObj)
                {
                    onHand = value;
                }
            }
        }
    }
}
