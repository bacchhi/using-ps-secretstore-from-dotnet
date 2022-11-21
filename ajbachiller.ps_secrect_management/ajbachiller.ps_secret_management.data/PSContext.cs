using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ajbachiller.ps_secret_management.data
{
    public class PSContext: DbContext
    {
        

        public PSContext(DbContextOptions<PSContext> options)
            : base(options)
        {
            
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=.\SQLEXPRESS;Database=PS_DB;Trusted_Connection=True;");
        }


        public DbSet<User> Users { get; set; }


    }

    public class User
    {        
        public string Username { get; set; }
    }
}
