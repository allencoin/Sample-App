module UsersHelper

	# Returns the gravatar for the given user
	def gravatar_for(user, options = { size: 200 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	# Returns tiny gravatar for the given user
	def tiny_gravatar_for(user)
    	gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    	"http://gravatar.com/avatar/#{gravatar_id}.png?s=30"
  	end
end
