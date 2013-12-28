class AutocompleteInput < SimpleForm::Inputs::CollectionInput
  
  def input
    label, value = detect_collection_methods
    
    # if reflection is not already set, set it
    @reflection = @reflection || object.reflections[attribute_name]
    case reflection.macro
    when :belongs_to
      @builder.hidden_field(attribute_name) + 
      template.text_field_tag("autocomplete_for[#{object_name}_#{reflection.name}]", object.send(reflection.name).try(label), :"data-source" => options[:source], :"data-field" => "##{object_name}_#{attribute_name}", :"data-min-chars" => options[:min_chars] || 3)
    else
      template.content_tag(:ul, current_selections.map { |s| selection_tag(s.send(value), s.send(label)) }.join('').html_safe, :id => "autocomplete_selections_for_#{object_name}_#{reflection.name}", :class => 'autocomplete_selections') +
      template.text_field_tag("autocomplete_multiple_for[#{object_name}_#{reflection.name}]", '', :"data-source" => options[:source], :"data-selections" => "#autocomplete_selections_for_#{object_name}_#{reflection.name}", :"data-min-chars" => options[:min_chars] || 3, :"data-template" => CGI.escapeHTML(selection_tag("ID", "VALUE")))
    end
  end
      
  def current_selections
    object.send(reflection.name)
  end
  
  def label_method
    o = reflection.klass.new
  end
  
  def selection_tag(id, name)
    template.content_tag(:li) do
      template.hidden_field_tag("#{object_name}[#{attribute_name}][]", id, :id => nil) + 
      template.sanitize(name) +
      template.link_to('Remove', '#', :class => 'remove')
    end
  end
  
end
