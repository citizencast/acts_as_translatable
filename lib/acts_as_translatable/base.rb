module ActsAsTranslatable
  module Base

    def acts_as_translatable
      columns_names.each do |col|
        if I18n.availables_locales.include?(col.split('_').last.to_sym)
          m_name = col.gsub("_#{I18n.current_locale}", '').to_sym 
          define_method m_name do
            send("#{m_name}_#{I18n.current_locale}")
          end
        end
      end

    end
      
  end
end
