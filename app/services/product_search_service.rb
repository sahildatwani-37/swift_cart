class ProductSearchService
  def initialize(category: nil, min_price: nil, max_price: nil, colors: [], sizes: [], query: '')
    @category = category
    @min_price = min_price
    @max_price = max_price
    @colors = colors
    @sizes = sizes
    @query = query
  end

  def search
    search_definition = {
      query: {
        bool: {
          must: [],
          filter: []
        }
      }
    }

    search_definition[:query][:bool][:must] << { match: { title: @query } } if @query.present?

    if @min_price.present? || @max_price.present?
      search_definition[:query][:bool][:filter] << {
        range: {
          price: {
            gte: @min_price || 0,
            lte: @max_price || 'Infinity'
          }
        }
      }
    end

    search_definition[:query][:bool][:filter] << { terms: { colors: @colors } } if @colors.any?
    search_definition[:query][:bool][:filter] << { terms: { sizes: @sizes } } if @sizes.any?

    if @category
      search_definition[:query][:bool][:filter] << { term: { category_id: @category.id } }
    end

    Product.__elasticsearch__.search(search_definition).records
  end
end


