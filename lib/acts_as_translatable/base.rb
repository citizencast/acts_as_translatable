module ActsAsTranslatable
  module Base

    def is_model_column?( column )
      column_names.include?( column.to_s )
    end

    def acts_as_translatable
      column_names.each do |col|
        locale = col.split('_').last.to_sym
        if I18n.default_locale == locale
          m_name = col.gsub("_#{locale}", '').to_sym
          class_eval %{
            def #{m_name}
              c_name = self.class.is_model_column?("#{m_name}_#{I18n.locale}") ? "#{m_name}_#{I18n.locale}" : "#{m_name}_#{I18n.default_locale}"
              send(c_name)
            end
          }
        end
      end 
    end

  end
end
