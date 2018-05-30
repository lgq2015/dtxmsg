PROC = dtxmsg
O1 = dtxmsg_common

include ../plugin.mak

LIBS += -lobjc -framework Foundation -framework CoreFoundation
STDLIBS += $(LIBS)

$(F)dtxmsg_common$(O): CFLAGS += -x objective-c++

ifdef __EA64__
ADDITIONAL_GOALS += dtxmsg_client
.PHONY: dtxmsg_client
dtxmsg_client: $(R)dtxmsg_client
$(R)dtxmsg_client: $(F)dtxmsg_common$(O) $(F)dtxmsg_client$(O)
	$(call link_dumb,$@ $^)
endif

# MAKEDEP dependency list ------------------
$(F)dtxmsg$(O)  : $(I)bitrange.hpp $(I)bytes.hpp $(I)config.hpp             \
	          $(I)dbg.hpp $(I)err.h $(I)expr.hpp $(I)fpro.h             \
	          $(I)funcs.hpp $(I)gdl.hpp $(I)hexrays.hpp $(I)ida.hpp     \
	          $(I)idd.hpp $(I)idp.hpp $(I)ieee.h $(I)kernwin.hpp        \
	          $(I)lines.hpp $(I)llong.hpp $(I)loader.hpp $(I)moves.hpp  \
	          $(I)nalt.hpp $(I)name.hpp $(I)netnode.hpp $(I)pro.h       \
	          $(I)range.hpp $(I)segment.hpp $(I)struct.hpp              \
	          $(I)typeinf.hpp $(I)ua.hpp $(I)xref.hpp dtxmsg.cpp        \
	          dtxmsg.h dtxmsg_common.h
$(F)dtxmsg_client$(O): $(I)err.h $(I)fpro.h $(I)llong.hpp $(I)pro.h         \
	          dtxmsg_client.cpp dtxmsg_client.h dtxmsg_common.h
$(F)dtxmsg_common$(O): $(I)llong.hpp $(I)pro.h dtxmsg_common.cpp            \
	          dtxmsg_common.h
