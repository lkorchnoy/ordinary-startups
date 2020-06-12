module StartupsHelper

    def category_id_field(startup)
    if @startup.category_id 
        hidden_field_tag "startup[category_id]", startup.category_id 
        else 
        select_tag "startup[category_id][]", options_from_collection_for_select(Category.all, :id, :name) 
        end 
    end

end
