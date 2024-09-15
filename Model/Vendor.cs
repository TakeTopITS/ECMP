using System;

namespace ProjectMgt.Model
{
    public class Vendor
    {
        public Vendor()
        {
        }

        private string vendorCode;
        private string vendorName;
        private string vendorEnlishName;
        private string type;
        private string salesPerson;
        private string contactName;
        private decimal discount;
        private string country;
        private string state;
        private string city;
        private string areaAddress;
        private string zp;
        private string tel1;
        private string tel2;
        private string fax;
        private string emailAddress;
        private string webSite;
        private string bank;
        private string bankAccount;
        private string currency;
        private decimal creditRate;
        private DateTime createDate;
        private string invoiceAddress;
        private string registrationAddressCN;
        private string registrationAddressEN;
        private string commant;
        private string creatorCode;
        private string belongDepartCode;
        private string belongDepartName;

        private decimal taxRate;
        private string clearingForm;


        public virtual string VendorCode
        {
            get { return vendorCode; }
            set { vendorCode = value; }
        }

        public virtual string VendorName
        {
            get { return vendorName; }
            set { vendorName = value; }
        }

        public virtual string Type
        {
            get { return type; }
            set { type = value; }
        }

        public virtual string VendorEnglishName
        {
            get { return vendorEnlishName; }
            set { vendorEnlishName = value; }
        }

        public virtual string SalesPerson
        {
            get { return salesPerson; }
            set { salesPerson = value; }
        }

        public virtual decimal Discount
        {
            get { return discount; }
            set { discount = value; }
        }

        public virtual string Country
        {
            get { return country; }
            set { country = value; }
        }

        public virtual string State
        {
            get { return state; }
            set { state = value; }
        }

        public virtual string City
        {
            get { return city; }
            set { city = value; }
        }

        public virtual string AreaAddress
        {
            get { return areaAddress; }
            set { areaAddress = value; }
        }

        public virtual string ZP
        {
            get { return zp; }
            set { zp = value; }
        }

        public virtual string Tel1
        {
            get { return tel1; }
            set { tel1 = value; }
        }

        public virtual string Tel2
        {
            get { return tel2; }
            set { tel2 = value; }
        }

        public virtual string Fax
        {
            get { return fax; }
            set { fax = value; }
        }

        public virtual string EmailAddress
        {
            get { return emailAddress; }
            set { emailAddress = value; }
        }

        public virtual string WebSite
        {
            get { return webSite; }
            set { webSite = value; }
        }

        public virtual string ContactName
        {
            get { return contactName; }
            set { contactName = value; }
        }

        public virtual string Currency
        {
            get { return currency; }
            set { currency = value; }
        }

        public virtual string Bank
        {
            get { return bank; }
            set { bank = value; }
        }

        public virtual string BankAccount
        {
            get { return bankAccount; }
            set { bankAccount = value; }
        }

        public virtual decimal CreditRate
        {
            get { return creditRate; }
            set { creditRate = value; }
        }

        public virtual DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        public virtual string InvoiceAddress
        {
            get { return invoiceAddress; }
            set { invoiceAddress = value; }
        }

        public virtual string RegistrationAddressCN
        {
            get { return registrationAddressCN; }
            set { registrationAddressCN = value; }
        }

        public virtual string RegistrationAddressEN
        {
            get { return registrationAddressEN; }
            set { registrationAddressEN = value; }
        }

        public virtual string Comment
        {
            get { return commant; }
            set { commant = value; }
        }

        public virtual string CreatorCode
        {
            get { return creatorCode; }
            set { creatorCode = value; }
        }

        public virtual string BelongDepartCode
        {
            get { return belongDepartCode; }
            set { belongDepartCode = value; }
        }

        public virtual string BelongDepartName
        {
            get { return belongDepartName; }
            set { belongDepartName = value; }
        }

        public virtual Decimal TaxRate
        {
            get { return taxRate; }
            set { taxRate = value; }
        }

        public virtual string ClearingForm
        {
            get { return clearingForm; }
            set { clearingForm = value; }
        }

        public virtual string DeviceName
        {
            get; set;
        }
    }
}