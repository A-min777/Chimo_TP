using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
    public class CollectionRepository : ICollectionRepository
    {

        private readonly AppDbContext _db;

        public CollectionRepository()
        {
            _db = new AppDbContext();
        }

        public bool AddCollection(UpdateCollectionDto dto)
        {
            var collection = new MemberCollection
            {
                MemberId = dto.MemberId,
                CourseId = dto.CourseId,
                CreatedDate = DateTime.Now
            };

            _db.MemberCollections.Add(collection);

            return _db.SaveChanges() > 0;
        }

        public bool RemoveCollection(UpdateCollectionDto dto)
        {
            var collection = _db.MemberCollections
                .FirstOrDefault(c => c.MemberId == dto.MemberId && c.CourseId == dto.CourseId);

            if (collection == null) return false;
            
            _db.MemberCollections.Remove(collection);

            return _db.SaveChanges() > 0;
        }
    }
}