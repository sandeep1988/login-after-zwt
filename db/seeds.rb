# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	User.create(email:"admin@gmail.com", password:"12345678", created_at:Time.now, v_firstname: "admin", v_lastname: "admin", v_im_skype: "admint_zwt",  v_im_password: "12345678", v_gmail: "admin@zealousweb.com", v_linkedin_url: "http://www.linkedin.com/admin", v_phone: "9754431024", e_type: 0)
	User.create(email:"sales@gmail.com", password:"12345678", created_at:Time.now, v_firstname: "sales", v_lastname: "sales", v_im_skype: "sales_zwt",  v_im_password: "12345678", v_gmail: "sales@zealousweb.com", v_linkedin_url: "http://www.linkedin.com/sales", v_phone: "9754431024", e_type: 1)