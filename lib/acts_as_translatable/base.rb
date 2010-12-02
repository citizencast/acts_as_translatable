module ActsAsTranslatable
  module Base

    def is_model_column?( column )
      column_names.include?( column.to_s )
    end

    def acts_as_translatable
      column_names.each do |col|
        if I18n.default_locale == col.split('_').last.to_sym
          m_name = col.gsub("_#{I18n.locale}", '').to_sym 
          define_method m_name do
            c_name = self.is_model_column?("#{m_name}_#{I18n.locale}") ? "#{m_name}_#{I18n.locale}" : "#{m_name}_#{I18n.default_locale}"
            send(c_name)
          end
        end
      end

    end
      
  end
end
