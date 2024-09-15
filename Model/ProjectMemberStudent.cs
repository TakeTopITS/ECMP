using System;

namespace ProjectMgt.Model
{
    public class ProjectMemberStudent
    {
        public ProjectMemberStudent()
        {
        }

        private string userCode;
        private string userName;
        private string gender;
        private int age;
        private string password;
        private string refUserCode;
        private int sortNumber;
        private string duty;
        private string jobTitle;
        private string officePhone;
        private string mobilePhone;
        private string eMail;
        private string workScope;
        private DateTime joinDate;
        private string departCode;
        private string departName;
        private string childDepartment;
        private string creatorCode;
        private string status;

        private string englishName;
        private string nationality;
        private string nativePlace;
        private string huKou;
        private string residency;
        private string address;
        private DateTime birthDay;
        private string maritalStatus;
        private string degree;
        private string major;
        private string graduateSchool;
        private string idCard;
        private string bloodType;
        private int height;
        private string language;
        private string urgencyPerson;
        private string urgencyCall;
        private string photoURL;
        private string signPictureURL;
        private string signPictureURL2;
        private string signPictureURL3;
        private string introducer;
        private string introducerDepartment;
        private string introducerRelation;
        private string comment;

        private string userType;

        private string userRTXCode;
        private string worktype;
        private string mdiStyle;

        private string passwordShal;
        private string allowDevice;

        public virtual string UserCode
        {
            get { return userCode; }
            set { userCode = value; }
        }

        public virtual string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        public virtual string Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        public virtual int Age
        {
            get { return age; }
            set { age = value; }
        }

        public virtual string Password
        {
            get { return password; }
            set { password = value; }
        }

        public virtual string RefUserCode
        {
            get { return refUserCode; }
            set { refUserCode = value; }
        }

        public virtual int SortNumber
        {
            get { return sortNumber; }
            set { sortNumber = value; }
        }

        public virtual string Duty
        {
            get { return duty; }
            set { duty = value; }
        }

        public virtual string JobTitle
        {
            get { return jobTitle; }
            set { jobTitle = value; }
        }

        public virtual string OfficePhone
        {
            get { return officePhone; }
            set { officePhone = value; }
        }

        public virtual string MobilePhone
        {
            get { return mobilePhone; }
            set { mobilePhone = value; }
        }

        public virtual string EMail
        {
            get { return eMail; }
            set { eMail = value; }
        }

        public virtual string WorkScope
        {
            get { return workScope; }
            set { workScope = value; }
        }

        public virtual DateTime JoinDate
        {
            get { return joinDate; }
            set { joinDate = value; }
        }

        public virtual string DepartCode
        {
            get { return departCode; }
            set { departCode = value; }
        }

        public virtual string DepartName
        {
            get { return departName; }
            set { departName = value; }
        }

        public virtual string ChildDepartment
        {
            get { return childDepartment; }
            set { childDepartment = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string Status
        {
            get { return status; }
            set { status = value; }
        }

        public virtual string EnglishName
        {
            get { return englishName; }
            set { englishName = value; }
        }

        public virtual string Nationality
        {
            get { return nationality; }
            set { nationality = value; }
        }

        public virtual string NativePlace
        {
            get { return nativePlace; }
            set { nativePlace = value; }
        }

        public virtual string HuKou
        {
            get { return huKou; }
            set { huKou = value; }
        }

        public virtual string Residency
        {
            get { return residency; }
            set { residency = value; }
        }

        public virtual string Address
        {
            get { return address; }
            set { address = value; }
        }

        public virtual DateTime BirthDay
        {
            get { return birthDay; }
            set { birthDay = value; }
        }

        public virtual string MaritalStatus
        {
            get { return maritalStatus; }
            set { maritalStatus = value; }
        }

        public virtual string Degree
        {
            get { return degree; }
            set { degree = value; }
        }

        public virtual string Major
        {
            get { return major; }
            set { major = value; }
        }

        public virtual string GraduateSchool
        {
            get { return graduateSchool; }
            set { graduateSchool = value; }
        }

        public virtual string IDCard
        {
            get { return idCard; }
            set { idCard = value; }
        }

        public virtual string BloodType
        {
            get { return bloodType; }
            set { bloodType = value; }
        }

        public virtual int Height
        {
            get { return height; }
            set { height = value; }
        }

        public virtual string Language
        {
            get { return language; }
            set { language = value; }
        }

        public virtual string UrgencyPerson
        {
            get { return urgencyPerson; }
            set { urgencyPerson = value; }
        }

        public virtual string UrgencyCall
        {
            get { return urgencyCall; }
            set { urgencyCall = value; }
        }

        public virtual string PhotoURL
        {
            get { return photoURL; }
            set { photoURL = value; }
        }

        public virtual string SignPictureURL
        {
            get { return signPictureURL; }
            set { signPictureURL = value; }
        }

        public virtual string SignPictureURL2
        {
            get { return signPictureURL2; }
            set { signPictureURL2 = value; }
        }

        public virtual string SignPictureURL3
        {
            get { return signPictureURL3; }
            set { signPictureURL3 = value; }
        }

        public virtual string Introducer
        {
            get { return introducer; }
            set { introducer = value; }
        }

        public virtual string IntroducerDepartment
        {
            get { return introducerDepartment; }
            set { introducerDepartment = value; }
        }

        public virtual string IntroducerRelation
        {
            get { return introducerRelation; }
            set { introducerRelation = value; }
        }

        public virtual string Comment
        {
            get { return comment; }
            set { comment = value; }
        }

        public virtual string UserType
        {
            get { return userType; }
            set { userType = value; }
        }

        public virtual string UserRTXCode
        {
            get { return userRTXCode; }
            set { userRTXCode = value; }
        }

        public virtual string PasswordShal
        {
            get { return passwordShal; }
            set { passwordShal = value; }
        }

        public virtual string WorkType
        {
            get { return worktype; }
            set { worktype = value; }
        }

        public virtual string MDIStyle
        {
            get { return mdiStyle; }
            set { mdiStyle = value; }
        }

        public virtual string AllowDevice
        {
            get { return allowDevice; }
            set { allowDevice = value; }
        }

        private string studentClass;

        public virtual string StudentClass
        {
            get;
            set;
        }

        private int classID;

        public virtual int ClassID
        {
            get;
            set;
        }

        private string attendedKindergarten;

        public virtual string AttendedKindergarten
        {
            get;
            set;
        }

        private int managedAfterClass;

        public virtual int ManagedAfterClass
        {
            get;
            set;
        }

        private string fatherName;

        public virtual string FatherName
        {
            get;
            set;
        }

        private string fatherUnit;

        public virtual string FatherUnit
        {
            get;
            set;
        }

        private string fatherPhone;

        public virtual string FatherPhone
        {
            get;
            set;
        }

        private string monthName;

        public virtual string MonthName { get; set; }

        private string monthUnit;
        public virtual string MonthUnit { get; set; }
        private string monthPhone;
        public virtual string MonthPhone { get; set; }

        private string admissionDate;
        public virtual string AdmissionDate { get; set; }

        private int isAllergy;

        public virtual int IsAllergy { get; set; }
        private int isAsthma;
        public virtual int IsAsthma { get; set; }
        private int isInheritedillnesses;
        public virtual int IsInheritedillnesses { get; set; }
        private int isMedicalAllergy;
        public virtual int IsMedicalAllergy { get; set; }
        private int isForbiddenillness;
        public virtual int IsForbiddenillness { get; set; }
        private int isSurgery;
        public virtual int IsSurgery { get; set; }
        private int isMajordiseases;
        public virtual int IsMajordiseases { get; set; }
        private string otherRemark;
        public virtual string OtherRemark { get; set; }

        private decimal wangFeePerSemester;
        public virtual decimal WangFeePerSemester { get; set; }

        private decimal meals;
        public virtual decimal Meals { get; set; }

        private decimal activityCost;
        public virtual decimal ActivityCost { get; set; }
        private decimal custodyAfterClass;
        public virtual decimal CustodyAfterClass { get; set; }
        private decimal replaceCosts;
        public virtual decimal ReplaceCosts { get; set; }

        private string creatUserCode;
        public virtual string CreatUserCode { get; set; }
    }
}