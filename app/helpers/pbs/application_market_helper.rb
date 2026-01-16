# frozen_string_literal: true

#  Copyright (c) 2026, Pfadibewegung Schweiz. This file is part of
#  hitobito_sac_cas and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_sac_cas

module Pbs
  module ApplicationMarketHelper
    def dropdown_applications_export(details = false)
      ::Dropdown::ApplicationsExport.new(self, current_user, params, details: details).to_s
    end
  end
end
