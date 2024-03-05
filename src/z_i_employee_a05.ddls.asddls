@AbapCatalog.sqlViewName: 'ZV_EMPL_A05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employees'
define root view Z_I_EMPLOYEE_A05
  as select from zemployee_a05 as Employee
{
      //Employee
  key e_number,
      e_name,
      e_department,
      status,
      job_title,
      start_date,
      end_date,
      email,
      m_number,
      m_name,
      m_department,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname

}
