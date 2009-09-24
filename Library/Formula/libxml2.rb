require 'brewkit'

class Libxml2 <Formula
  @version='2.7.5'
  @url="ftp://xmlsoft.org/libxml2/libxml2-sources-#{@version}.tar.gz"
  @homepage='http://xmlsoft.org/index.html'
  #@md5='77b0d8b9885496871bb083165b35ba11'

  def install
    system "./configure --prefix='#{prefix}'"
    system "make install"
  end
end
