module PostsHelper

  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    if votes.size > 5
      count_likers(votes)
    else
      list_likers(votes)
    end
  end

  def count_likers(votes)
    votes.size.to_s + ' people like this'
  end

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name, profile_path(voter.user_name))
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def liked_post_link(post)
    if current_user.voted_for? post
      unlike_post_path(post.id)
    else
      like_post_path(post.id)
    end
  end

  def liked_post_icon(post)
    if current_user.voted_for? post
      'glyphicon-heart'
    else
      'glyphicon-heart-empty'
    end
  end

  def likers_class(post)
    if post.votes_for.up.by_type(User).size > 0
      'post__likers'
    end
  end

  def comments_class(post)
    if post.comments.count > 0
      'post__comments'
    end
  end


  private

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
