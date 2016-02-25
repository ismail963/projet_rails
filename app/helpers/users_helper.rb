module UsersHelper

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.nom,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def age(user) 
 	now = Time.now.utc.to_date
 	now.year - user.date_naissance.year - (user.date_naissance.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def has_cv?(user)
	!user.cv.nil?
  end
end
