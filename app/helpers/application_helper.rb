module ApplicationHelper
  
  def tweet_button(params = {}, text = "Tweet")
    query_params = {
      :url => root_url,
      :text => "Checking out @CloseGuru, the awesome site to turn your talents into fun and profit."
    }.merge(params)
    query = query_params.inject() {|str, kv| "#{kv.first}=#{kv.last}"}
    link_to "Tweet", "http://twitter.com/share?#{query}", :class => "twitter-share-button"
  end

  def tweet_button_for_class(classroom, activity = :show)
    text = case activity
      when :taking
        "I'm taking \"#{classroom.name}\" thru @CloseGuru"
      when :offering
        "Who's interested in \"#{classroom.name}\", my new course thru @CloseGuru?"
      else
        "Checking out \"#{classroom.name}\" on @CloseGuru"
      end
    
    # can't use to_query since that escapes content in a way Twitter doesn't like
    tweet_button(
      :url => url_for_classroom(classroom),
      :text => text    
    )
  end
end
