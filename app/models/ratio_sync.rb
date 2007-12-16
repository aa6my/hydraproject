class RatioSync < ActiveRecord::Base
  has_many :ratio_snapshots
  
  def self.last(domain)
    RatioSync.find(:first, :conditions => ["domain = ?", domain], :order => 'sync_id DESC')
  end
  
  def self.next_id(domain)
    rs = RatioSync.last(domain)
    (rs.nil?) ? nil : (rs.sync_id + 1)
  end
  
end