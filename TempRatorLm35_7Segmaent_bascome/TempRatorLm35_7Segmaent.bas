$regfile="m8def.dat"
$crystal=1000000


config portC=output
config portd=output
config portc.0=input

config adc=single,prescaler=auto,reference=avcc

 DIG1 alias portD.2
 DIG2 alias POrtD.3
 DIG3 alias portD.4



 a alias portc.2
 b alias portc.1
 c alias portd.7
 d alias portd.6
 e alias portD.5
 f alias portc.3
 g alias portc.4
 p alias portc.5

 dim number as byte
 dim i as byte
 dim str_temp as string *4
 dim str_dig as string *1
 dim temp as word


declare sub NumberTo_7segment(number as byte)
declare sub  allDigoff



    do
    start adc
       temp=getadc(0)
       temp=temp/2
       waitms 5
       stop adc

       str_temp=str(temp)

     allDigoff
     reset dig1
       str_dig=mid(str_temp,1,1)
       i=val(str_dig)
       call NumberTo_7segment(i)
         if temp < 10 then reset p
       waitms 5
     allDigoff
     reset dig2
        str_dig=mid(str_temp,2,1)
       i=val(str_dig)

       call NumberTo_7segment(i)
         if temp >= 10 then reset p
       waitms 5
     allDigoff
     reset dig3
       str_dig=mid(str_temp,3,1)
       i=val(str_dig)
      call NumberTo_7segment(i)
         if temp >= 100 then set p
      waitms 5

    loop


end



sub  allDigoff
set  dig1
set  dig2
set  dig3
end sub  allDigoff

sub  NumberTo_7segment(number)
select case number

  case 1:
  set a
  reset b
  reset c
  set d
  set e
  set f
  set g
  set p

      case 2:
      reset a
      reset b
      set c
      reset d
      reset e
      set f
      reset g
      set p

         case 3:
         reset a
         reset b
         reset c
         reset d
         set e
         set f
         reset g
         set p


            case 4:
            set a
            reset b
            reset c
            set d
            set e
            reset f
            reset g
            set p

               case 5:
                reset a
                set b
                reset c
                reset d
                set e
                reset f
                reset g
                set p

                  case 6:
                  reset a
                  set b
                  reset c
                  reset d
                  reset e
                  reset f
                  reset g
                  set p

                    case 7:
                    reset a
                    reset b
                    reset c
                    set d
                    set e
                    set f
                    set g
                    set p

                          case 8:
                          reset a
                          reset b
                          reset c
                          reset d
                          reset e
                          reset f
                          reset g
                          set p


                           case 9:
                           reset a
                           reset b
                           reset c
                           reset d
                           set e
                           reset f
                           reset g
                           set p

                            case 0:
                            reset a
                            reset b
                            reset c
                            reset d
                            reset e
                            reset f
                            set g
                            set p

case else
end select
end sub  NumberTo_7segment
end


