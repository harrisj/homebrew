require 'brewkit'

class Db <Formula
  @url='http://download.oracle.com/berkeley-db/db-4.8.24.tar.gz'
  @homepage='http://www.oracle.com/technology/products/berkeley-db/index.html'
  @md5='147afdecf438ff99ade105a5272db158'

  def install
    # BerkeleyDB dislikes parallel builds
    ENV['MAKEFLAGS'] = ''
    
    # BerkeleyDB requires you to build everything from the build_unix subdirectory
    Dir.chdir 'build_unix'
    
    system "../dist/configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--mandir=#{prefix}/share/man"
                          
    system "make install"

    Db.new.brew {|f| bin.install 'db'}
  end
end
