module StartupsHelper

    def category_id_field(startup)
        if startup.category.nil? 
            select_tag "startup[category_id]", options_from_collection_for_select(Category.all, :id, :name)
        else  
            hidden_field_tag 
            "startup[category_id]", startup.category_id 
        end 
    end

    

end
