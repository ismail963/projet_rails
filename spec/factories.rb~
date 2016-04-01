# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |user|
  user.nom                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.date_naissance "1994-07-29"
  user.films_vu_par_semaine "180"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
