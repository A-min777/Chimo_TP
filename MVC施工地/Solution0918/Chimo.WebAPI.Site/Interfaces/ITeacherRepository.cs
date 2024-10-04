using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
    public interface ITeacherRepository
    {
        List<Cours> GetCoursesByTeacherId(int id);
        int GetStudentCountByTeacherId(int id);
        Teacher GetTeacherById(int id);
    }
}
