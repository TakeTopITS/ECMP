DECLARE @x table (
email varchar(100),
CompanySubCategoryId xml
)

DECLARE @xmlvar xml, @xmlvar2 xml

SET @xmlvar = '<root><item value="1" /><item value="2" /><item value="4" /><item value="9" /></root>'
SET @xmlvar2 = '<root><item value="3" /><item value="5" /><item value="4" /><item value="9" /></root>'

insert into @x values ('show@def.com', @xmlvar)
insert into @x values ('noshow@def.com', @xmlvar2)


select email from @x
where CompanySubCategoryId.exist('/root/item[@value=1 or @value=2]') = 1

select email from @x
where CompanySubCategoryId.exist('/root/item[@value=(1,2,3)]') = 1


 