module ApplicationHelper

  def format_name(named_object)
    [ named_object.last_name, named_object.first_name ].join(", ")
  end

end
