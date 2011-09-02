
require 'opencv-ffi/core/dynamic'

module CVFFI

  class Sequence
    include Enumerable

    attr_accessor :seq

    def initialize( seq )
      ArgumentError "Don't know how to handle class #{seq.class}" unless seq.is_a?(CvSeq)
      @seq = seq
    end

    def each
      size.times { |i|
        yield CVFFI::cvGetSeqElem( @seq, i )
      }
    end

    def size
      @seq.total
    end

    def [](i)
      CVFFI::cvGetSeqElem( @seq, i )
    end

  end

end
