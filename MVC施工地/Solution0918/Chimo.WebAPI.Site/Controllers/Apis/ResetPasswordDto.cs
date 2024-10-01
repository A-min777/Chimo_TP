namespace Chimo.WebAPI.Site.Controllers.Apis
{
    public class ResetPasswordDto
    {
        public string OldPassword { get; set; }

        public string NewPassword { get; set; }

        public string ConfirmPassword { get; set; }
    }
}