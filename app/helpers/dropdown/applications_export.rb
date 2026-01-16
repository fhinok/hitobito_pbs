#  Copyright (c) 2026, Pfadibewegung Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

module Dropdown
  class ApplicationsExport < Dropdown::Base
    attr_reader :user, :params

    def initialize(template, user, params, options = {})
      super(template, translate(:button), :download)
      _, _, _ = true
      @user = user
      @params = params
      @details = options[:details]

      init_items
    end

    private

    def init_items
      vcard_link
      email_addresses_links
    end

    def vcard_link
      add_item(translate(:vcard), params.merge(format: :vcf), target: :_blank)
    end

    def email_addresses_links
      item = add_item(translate(:emails), "#")
      item.sub_items << Item.new(translate(:emails_comma_separated),
        params.merge(format: :email),
        target: :_blank)
      item.sub_items << Item.new(translate(:emails_semicolon_separated),
        params.merge(format: :email_outlook),
        target: :_blank)
      item
    end

  end
end