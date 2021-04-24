using ProjectHomeWork.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectHomeWork.Manager
{
    class Model
    {
        private static DbHomeWorkEntities entities = null;
        public static DbHomeWorkEntities GetEntities()
        {
            if(entities == null)
            {
                entities = new DbHomeWorkEntities();
            }
            return entities;
        }
    }

   
}
