# En utilisant le symbole ':user', nous faisons que
# Factory Girl simule un modèle User.
Factory.define :user do |user|
  user.nom                  "Ismail Elfaqir"
  user.email                 "elfaqir963@gmail.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

