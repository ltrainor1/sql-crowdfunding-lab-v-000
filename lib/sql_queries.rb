# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"SELECT Projects.title, SUM(Pledges.amount)
FROM Projects
LEFT OUTER JOIN Pledges
ON Projects.id = Pledges.project_id GROUP BY Projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"SELECT Users.name, Users.age, SUM(Pledges.amount)
FROM Users
LEFT OUTER JOIN Pledges
ON Users.id = Pledges.user_id GROUP BY Users.name ORDER BY Users.name ASC"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT Projects.title, SUM(Pledges.amount) - Projects.funding_goal
  FROM Pledges
  LEFT OUTER JOIN Projects
  ON Pledges.project_id = Projects.id
  GROUP BY Projects.title
  HAVING SUM(Pledges.amount) - Projects.funding_goal >= 0"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"SELECT Users.name, CAST(SUM(Pledges.amount) as REAL)
  FROM Users
  LEFT OUTER JOIN Pledges
  ON Users.id = Pledges.user_id
  GROUP BY Users.name
  ORDER BY SUM(Pledges.amount) ASC"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT Projects.category, CAST(Pledges.amount as INT)
From Projects
LEFT OUTER JOIN Pledges
ON Projects.id = Pledges.project_id
WHERE Projects.category = 'music'
ORDER BY Pledges.id ASC"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT Projects.category, CAST(SUM(Pledges.amount) as REAL)
From Projects
LEFT OUTER JOIN Pledges
ON Projects.id = Pledges.project_id
WHERE Projects.category =  'books'"
end
