using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
    public class CollectionService
    {
        private readonly ICollectionRepository _repo;

        public CollectionService()
        {
            _repo = new CollectionRepository();
        }
        internal bool AddCollection(UpdateCollectionDto dto)
        {
            return _repo.AddCollection(dto);
        }

        internal bool RemoveCollection(UpdateCollectionDto dto)
        {
            return _repo.RemoveCollection(dto);
        }
    }
}