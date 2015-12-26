require 'middleman-core'

module Middleman
  module CDN
    class CDNExtension < Middleman::Extension
      option :cloudflare, nil, 'CloudFlare options'
      option :cloudfront, nil, 'CloudFront options'
      option :fastly, nil, 'Fastly options'
      option :maxcdn, nil, 'MaxCDN options'
      option :rackspace, nil, 'Rackspace options'
      option :filter, nil, 'Cloudflare options'
      option :after_build, false, 'Cloudflare options'

      def initialize(app, options_hash = {}, &block)
        super
      end

      def after_build(builder)
        ::Middleman::Cli::CDN.new.cdn_invalidate(options) if options.after_build
      end

      def registered
        included
      end

    end
  end
end
