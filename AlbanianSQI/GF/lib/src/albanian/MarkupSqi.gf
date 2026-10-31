--# -path=.:../abstract:../common:../prelude

concrete MarkupSqi of Markup = CatSqi, MarkHTMLX ** {

lin
  MarkupCN m cn = cn ** {
    s = \\sp,c,n => appMark m (cn.s ! sp ! c ! n)
  } ;
  MarkupNP m np = np ** {
    s = \\c => appMark m (np.s ! c)
  } ;
  MarkupAP m ap = ap ** {
    s = \\sp,c,g,n => appMark m (ap.s ! sp ! c ! g ! n)
  } ;
  MarkupAdv m adv = adv ** {s = appMark m adv.s} ;
  MarkupS m s = s ** {s = appMark m s.s} ;
  MarkupUtt m utt = utt ** {s = appMark m utt.s} ;
  MarkupPhr m phr = phr ** {s = appMark m phr.s} ;
  MarkupText m txt = txt ** {s = appMark m txt.s} ;

}
