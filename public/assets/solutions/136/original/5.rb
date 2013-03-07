class Class
        def history_accessor(attr_name)
                attr_name = attr_name.to_s  # make sure it's a string
                attr_reader attr_name  # create the attribute's getter
                attr_reader attr_name+"_history" # create bar_history
                class_eval  %Q{
                        def #{attr_name}=(attr_name)
                                @attr_name = attr_name                                                         
                                if  @#{attr_name}_history then
                                  @#{attr_name}_history << attr_name
                                else
                                  @#{attr_name}_history = Array.new
                                  @#{attr_name}_history << nil
                                  @#{attr_name}_history << attr_name
                                end                                            
                        end
                        }
        end
end
