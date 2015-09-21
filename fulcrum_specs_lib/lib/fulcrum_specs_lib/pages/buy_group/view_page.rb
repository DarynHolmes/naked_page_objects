module FulcrumSpecsLib
  module Pages
    module BuyGroup
      # Encapsulates page implementation details
      class ViewPage < FulcrumSpecsLib::Pages::BasePage
        TO_BE_RE_ORDERED = 'To Be Re-Ordered'
        TO_BE_ORDERED = 'To Be Ordered'
        REJECTED = 'Rejected'
        ORDERED = 'Ordered'

        def initialize(buy_group_id: buy_group_id)
          super("/buying/buygroup/#{buy_group_id}/view")
        end

        def pids
          all('.product_status').map { |elem| elem[:name].match(/(review_)(.*)(_buying_status_id)/i)[2].to_i } # extract the id
        end

        def mark_for_order(pid)
          select_name = "review_#{pid}_buying_status_id"
          case find("select[name=#{select_name}] option[selected=selected]").text
          when REJECTED
            select TO_BE_ORDERED, from: select_name
          when ORDERED
            select TO_BE_RE_ORDERED, from: select_name
          end
        end

        def mark_pids_for_order(pids)
          pids.each { |pid| mark_for_order(pid) }
        end

        def update
          click_button 'Update'
        end
      end
    end
  end
end
