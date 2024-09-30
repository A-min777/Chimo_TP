using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
    public interface ICollectionRepository
    {
        bool AddCollection(UpdateCollectionDto dto);
        bool RemoveCollection(UpdateCollectionDto dto);
    }
}
