# Define the database connection to be used for this model.
connection: "thelook"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: isidro_the_look_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: isidro_the_look_default_datagroup

#<<<<<<< HEAD

explore: dt_orders{}
#=======
#explore: dt_orders{}
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git

explore: imgsrc1onerroralert2 {}

explore: test_j {}

explore: account {}

explore: connection_reg_r3 {}

explore: dept {}

explore: employees {}



explore: users {}

explore: flights {}

explore: human {}



explore: incremental_pdts_test {}

explore: ints {}




explore: orders {}

explore: order_items {}

explore: pegdates {}

explore: person {}

explore: persons {}

explore: persons2 {}

explore: products {}

explore: salary {
  join: dept {
    type: left_outer
    sql_on: ${salary.dept_id} = ${dept.dept_id} ;;
    relationship: many_to_one
  }
}



explore: schema_migrations {}



explore: test {}



explore: chi_square_example_dt {}

#=======
explore: dt_timeline_test {}
#>>>>>>> branch 'master' of git@github.com:hijuancarlos/gcpm2210_thelook-.git


datagroup: test_dt_users {
  sql_trigger: SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()) ;;
  #interval_trigger: "5 minutes"
}


datagroup: test_dt_users_2 {
  #sql_trigger: SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP()) ;;
  #interval_trigger: "5 minutes"
  max_cache_age: "3 minutes"
}

explore: dt_users {}
