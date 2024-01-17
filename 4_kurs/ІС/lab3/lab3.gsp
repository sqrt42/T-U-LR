^Lk`    8
   B a s e P l u g i n    
   C a l c P c o m b i        �<?xml version="1.0" encoding="UTF-8"?>
<Project>
    <Metadata>
        <Description>The template creates regression model.</Description>
        <Optimizer builtin="regression"/>
    </Metadata>
    <DataExplorer page="table" viewMode="dataset"/>
    <Conveyor showDataManager="1" showPreproEditors="1">
        <Import file="BasePlugin" feature="4" description="CSV/XLS/XLSX connection" sidebar="0"/>
        <Prepro file="BasePlugin" feature="2" description="Regression and classification" sidebar="0" visible="1"/>
        <Calc file="CalcPcombi" feature="0" description="Solver" sidebar="0" visible="0"/>
        <Postpro file="BasePlugin" feature="3" description="Postprocess" sidebar="0" visible="0"/>
        <Visualizers>
            <Visualizer file="BasePlugin" feature="0" description="Plot" sidebar="0" visible="1"/>
            <Visualizer file="BasePlugin" feature="5" description="Classification accuracy" sidebar="0" visible="0"/>
            <Visualizer file="BasePlugin" feature="6" description="Table" sidebar="0" visible="1" pinnedToFile="BasePlugin" pinnedToFeature="0"/>
            <Visualizer file="BasePlugin" feature="7" description="Residuals" sidebar="0" visible="1"/>
            <Visualizer file="BasePlugin" feature="8" description="Accuracy" sidebar="0" visible="1"/>
            <Visualizer file="BasePlugin" feature="9" description="Raw model" sidebar="0" visible="1"/>
            <Visualizer file="BasePlugin" feature="10" description="Importance of variables" sidebar="0" visible="0"/>
            <Visualizer file="BasePlugin" feature="11" description="Forecast report" sidebar="0" visible="0"/>
            <Visualizer file="BasePlugin" feature="15" description="Accuracy tracking" sidebar="0" visible="0"/>
        </Visualizers>
    </Conveyor>
    <Toolbar>
        <Button name="btNew" visible="1"/>
        <Button name="btOpen" visible="1"/>
        <Button name="btSave" visible="1"/>
        <Button name="btReload" visible="0"/>
        <Button name="btChangeData" visible="0"/>
        <Button name="btLoadTemplate" visible="0"/>
        <Button name="btSimulation" visible="0"/>
        <Button name="btStartStop" visible="1"/>
        <Button name="btApplyModel" visible="0"/>
        <Button name="btConfiguration" visible="0"/>
    </Toolbar>
    <PluginStorage>
        <Storage file="BasePlugin" feature="1" description="Time series forecasting">
            <autowindow>0</autowindow>
            <holdout>0</holdout>
            <repeat>1</repeat>
        </Storage>
        <Storage file="BasePlugin" feature="2" description="Regression and classification">
            <uniform>uniform</uniform>
            <unit>percent</unit>
            <unk>50</unk>
        </Storage>
        <Storage file="BasePlugin" feature="3" description="Postprocess">
            <n>1</n>
            <nonneg>0</nonneg>
            <round>0</round>
        </Storage>
        <Storage file="BasePlugin" feature="4" description="CSV/XLS/XLSX connection">
            <allnull>0</allnull>
            <compositeid></compositeid>
            <customcolheaders></customcolheaders>
            <delim>,</delim>
            <fullpath>C:\Users\V\Desktop\osv_\4_kurs\ІС\lab3\rand2.xlsx</fullpath>
            <hashead>1</hashead>
            <importall>0</importall>
            <importallsheets>0</importallsheets>
            <null></null>
            <relpath>rand2.xlsx</relpath>
            <reverserows>0</reverserows>
            <rowid>0</rowid>
            <skiprows>0</skiprows>
            <transpose>0</transpose>
        </Storage>
        <Storage file="BasePlugin" feature="6" description="Table">
            <showconfidence>0</showconfidence>
            <showindex>0</showindex>
            <showoverride>0</showoverride>
            <showresidual>1</showresidual>
            <transpose>0</transpose>
        </Storage>
        <Storage file="BasePlugin" feature="8" description="Accuracy">
            <error>0</error>
        </Storage>
        <Storage file="CalcPcombi" feature="0" description="Solver">
            <complexity>0</complexity>
            <core>combiquick</core>
            <criterion>rmse</criterion>
            <folds>2</folds>
            <fs_algo>byerror</fs_algo>
            <fs_vars>20</fs_vars>
            <layers>33</layers>
            <learnweight>0</learnweight>
            <maxreweights>3</maxreweights>
            <maxsinglepower>1</maxsinglepower>
            <maxsinglepower2>1</maxsinglepower2>
            <maxsumpower>1</maxsumpower>
            <maxsumpower2>1</maxsumpower2>
            <maxvarmixture>1</maxvarmixture>
            <maxvarmixture2>1</maxvarmixture2>
            <minsinglepower>0</minsinglepower>
            <minsinglepower2>0</minsinglepower2>
            <model>linear</model>
            <model2>linear</model2>
            <ncpu>0</ncpu>
            <reorder>oddeven</reorder>
            <storedmodels>200</storedmodels>
            <storedmodelsn>1000</storedmodelsn>
            <strategy>kfold</strategy>
            <test>40</test>
            <timeseries>0</timeseries>
            <train>60</train>
        </Storage>
    </PluginStorage>
    <CommonStorage>
        <Storage name="gs.prepro">
            <aligntoknown>1</aligntoknown>
            <decompositionlimit>0</decompositionlimit>
            <deleteinputduplicates>1</deleteinputduplicates>
            <expand>1</expand>
            <holidays>USA</holidays>
            <nonrecent>Preprocess</nonrecent>
            <null>Median</null>
            <outlierlevel>0</outlierlevel>
            <shortfiles>error</shortfiles>
            <skipshortfiles>0</skipshortfiles>
            <text>x1, cubert
x2, cubert
x3, cubert
x4, cubert
x5, cubert
x6, cubert
x7, cubert
x8, cubert
x9, cubert
x10, cubert
x11, cubert
:Target
y
</text>
            <textinputs>Skip</textinputs>
            <texttargets>Error</texttargets>
        </Storage>
        <Storage name="gs.prepro.ts">
            <frame>30</frame>
            <frametype>maxpossible</frametype>
            <shift>24</shift>
        </Storage>
    </CommonStorage>
</Project>
    ����    4           D                            "       "   "          �С+@y@�dl�W�@�����@E���h0u@�5Tj���@v3�R#Qu@g1}n���@$6w6��@TP��{@9����~@�T�PR`@r굧et@	]�@U��?H�kB'�P@�v�+j+E@; �[T@�?i�~@��#˨�@m�/ck@�M=mPJ@>��Ԍ�@�7�e@�7�=��v@�j��@��A�lE@�K�ﾁ@�'o=D@���c�f@ �X>s4F@��Z�A�m@>(M&��g@i�c���@�|�5��f@~!��gFd@�1
��I@]�����q@2].�4VL@�(�^'�"@0���5]@F�'��o@��2�~��@=��4�t@�^`U-�q@���:��@�4�14@�H����@��k�	�n@�P�2Nr@�m+�Q�@���s�n@.��˽�t@�s&��{@�:���sV@�Y���*v@:�|��@�^ur@�ʟA��@-E�Y�U@�C���?��bk@"U,���e@�(�h�{@e���y@�I�8/�@�1L��0l@{]���%@��&Ђ@�[��˅�@   "   1    3    5    7    9    1 1    1 3    1 5    1 7    1 9    2 1    2 3    2 5    2 7    2 9    3 1    3 3    3 5    3 7    3 9    4 1    4 3    4 5    4 7    4 9    5 1    5 3    5 5    5 7    5 9    6 1    6 3    6 5    6 7    2    4    6    8    1 0    1 2    1 4    1 6    1 8    2 0    2 2    2 4    2 6    2 8    3 0    3 2    3 4    3 6    3 8    4 0    4 2    4 4    4 6    4 8    5 0    5 2    5 4    5 6    5 8    6 0    6 2    6 4    6 6    6 8    r a n d 2    y        ����   x 1     ��������"               cubert         ����   x 2     ��������"                   ����   x 3     ��������"                   ����   x 4     ��������"                   ����   x 5     ��������"                   ����   x 6     ��������"                   ����   x 7     ��������"                   ����   x 8     ��������"                   ����   x 9     ��������"                  "����   x 1 0     ��������"                  "����   x 1 1     ��������"                  ����   y     ����    "            t  ��S��,@Lg���&.@5?kU�R&@M���\@�o�F@��J���*@K�Yh�&@V�_S�)@�t�k�@#�e0��-@>#���� @o���n @"�9�W,@B*òX+@lI���*@�I�6)@N��@!@B
��n�,@���3-@�KX��)@���_8,@d��T�(@zܚ�+@����<�,@�V���z(@5���4�*@�LQ��+@����s&@q��+#@���M�!@����1#@��[%ޫ&@ր(��g(@������ @2��*@�¡V�H+@����b%@WQ5�g�,@��N*@����6*@ �!�@�4m�{�@֓�ʪ-@��/@��4+&@A���F@�3X��&@|���WS,@�<V���,@�hFӃ\+@5�k/m(@�4��F)@�����#@~�����-@ᐾ�ٌ+@u�;e,@�GTW�2@�#G���*@#�j:�7&@�A��O�@��[j97.@t '�&@��o�yW&@�]�� �@�`Ě��%@��>e@�-�LyU@����u(@W:�Ȣ7)@y���_8@��-�3@3���.@"�`�o @�c�޳a+@�^Y�(@Z���h�,@z-I�!)@�o���-@�kK���$@�I�h� @��iH8�*@Q+<�%@���i@��s��,@cD	m'@!��F�!@��}�4�@t%lV�,@$�k��-@�v��5#@89�p%@��Ʃeh)@O�v�$@D]ۥ'q @�E�v�'@Z�5�GA@k�O0�(@�@��6+@�u5i�,@S#���J,@�ڐ�.e&@�zf�B!@b[��'/(@��y�u)@�D!p�)@�掶�*@-����)@8]�Q/�	@bK�*�5%@	[��:'@�lF�@#@�
�]m##@�c���,@It�cB=%@�c\�-@�j�`q!@���I�@�Py�!�*@˹�r�@	UI��%@�o2U��-@=��w^(@�	
�|�)@�G�JNr-@PŸ&!@sd�R!@c��"M%@Ǥ"�_)@��{���$@�Ⅾ�+@����"+@s�"�g,@D|���>(@�*8Ef!@�59yR,@P�J�A1%@����@�bw({['@��g�F&@����u!@��r���(@]�݃+. @7 �?�)@��Wk�W @f|H��@^��ѹ�'@dQ�wvL&@Q׊Y,@zQ��@g'@�� �A+@�J�O��@����%@���!sx@�(�Sw=-@O�K���@^��s��+@�l� �@1���+~"@����+@)�
�z�%@����X�@N�	r�'@p(0qA)@v$�أ�%@��n�
@��p\��-@���۹)@�%(��@}Ur	�r%@��1��)@��=�+@�7�.,�$@}�i;:(@�$	c�,@duH�@��]/�@�%^m:,-@O"k�QD-@7�kcB�,@C&��­*@C���i*@Q�I��p(@�=�$@m�<�Q�*@9��'@��v��8@�2*��"@m�$�^J$@���8*@�=���.@o�EW�� @ȝ3'��'@ǳ�:ڏ$@XX[�l$@7��T�(@�����)@c�銛�"@�@���)@s:=]�$@�[F���'@.�w���-@����/@#@��e��+@#� �-+@���	��'@�
�3�,%@C@��T�@�Tb]�"@�%%�,@?�X%&)@����O @
��;B�,@%���z'@��ʧ�)@,>?�^-+@�I(��,@�E��@D���*@S���Ԉ(@�b�|��"@^��M�#@*6��Z�-@8?t�=+@��`R%@4�ԡ(@���ԃ+@����,@!Y�^|)@�
j @�
\<@R� ���+@}����U$@���$�$&@���Y!.@xH�Hr�"@o)36:)@�~��M,@���pW*@8�͘��+@��q-@N`A;�*@�e�s9#@@� 4�l#@'��S*@?��"��+@�K(�&'@D��g�+@��=�ۀ+@"k��{�#@��߯��,@D]�2_
.@����(@��[�!@Q����,@�@ �	%@�u��V@��Ղ,@���)"@�]|�9@���_��*@R��S,@�X�Bf�'@�R�Ŗ(@2 �Ip�#@�DvP�!@Ɂ�(-@��z;sC$@v;����,@�w"X�*@�,�>�"@4ѫp0�+@�Y,l~#@�EkdW�%@t��B�
@�qI��,@��9X(�(@NF4�*@}��9��,@`(O}�,@&:�k4Z!@�eI8�&@c[��ha(@t�/I6�)@#f_�fj*@8a�pӷ-@ 1U+@�ҷ��+@>��a�,@�k<�?p(@����$@/]�``+@_�f+�-@�c���k&@2z8ɚ!'@�b	��4-@�4��-@HV��@O�4H��*@�cؠǩ@yz�|�*@�BW]@O�Q��&@Qc�6�%@~�� @3 @��]��-@�X׀�"@�K'3+&@aݚz� @��D@7@r��#�$@������ @Y!Y��-@T���x@�4E�($@;E�*@��,@,�)@�Gj%=:!@QTJC�!@�qJ��-@�T����+@��OS�n-@�$#M��'@o���@�%1��$@����9�,@�W�y�I&@D�%�@M�9p��*@��6��&@�v�,�;$@������ @�Į b;.@���,@�!>8��+@�<Q@�8V�K*@�K҉� &@jS%%�,@�w�t�
'@�`\��t%@�	nu�,@�ܣ�S�(@�|��1&@<��0Cv%@� 
�-@���
��,@ا·�=&@¸*G�$@�z��I�@�h5��@Ct|(J�'@Dżm�%@�4�ɕ4-@#þQy'@�1/�_� @�&����)@d��e�(@&��)��#@�G��;�#@K`r��z-@��\ �"@�}�]�\@/��"%@fr\A�B)@���x #@�{ͯ%�*@�p�s]�%@E���@���2�$@��x��)@�a�v�[$@Dt��R$@0�����$@������%@�e��c(,@�C��rX$@���.�W,@C^:�s?-@P�#��-@�]��*@��@I(+@D� ��)@س�Y"@DՓ�s�!@�,u�ic-@^ak(}@�l�-�)@B%z��*@@m��x*@�Y���'@M�"���%@�����'@񈇤�-#@����%�'@��-LL�(@��)[��#@���-@�tg0��)@!�E�.,@ʒ���*@���z�n@�3�Q�;@�'V�q*@�Îa+@�5��*@��A,@�����u$@;ɯ*�@��N�� .@t/��@@LK�#�� @��	.@$�%���(@�9�=}�*@h�g�h�@�[�P8$)@�^T��Y&@�����&@�*<n�%@�!��@�/zڂ-@��R���%@�����o+@��8ۮ(@Lq�� ,@��Cn�"$@O����@|Y	 -@�"դ�F+@��(|W3!@������'@�^��@�T���@���X��@qh0 4%@�}��$@_g�b�8,@����S@����(@x��LA@!���8(@^���%@yD`�+@~��� � @=Zi�}*@~�m�,@"`|�+�&@.�aa�%@S�����@	"�á&@��( �@>��g�.@�ex0-@���O-@Bd���)@ޯ*�.@���Z*@�����"@����A(@W���-@��A��!@����7+@�=}D\&@h�S�#@R�5>�,@kymm%@\mx+@�ϯ�f#@�
r�%@]c�<[t'@����+@#�3D��,@��o�	%@���[2,@�[��%G&@����R+@��0H֐-@}d�H�a&@��G�)@��)��*@�k�~@-@ɂ& ��@V��%'8@��v��)@U߷�(%@�@!�g@5�da�U#@���è@�v��w*@;�4���'@X{�ȩ+@\g1>*+@��ڜ!�)@oQ+HyW,@H���"@�M٘��-@Ǥz�ɜ@W�~٧+@Օ���$@.V�22�)@�Sfm�)@�bi|�%@S���
'@�*�y��"@p�R��*@�y����@���?�!@Kݔv�*@֝�K�G)@��]<�'@.�o��@V,6	#J#@Uň�^�"@+��4R@QZ��\�'@ϋk�"*@e��h2d@YBg���,@��Q^�w'@��(���'@GC����"@kz���,@���|��*@1���-@묾JG�+@��5��*@����Q�+@j���E�,@2�"�,@%�i��!@����5$@���8�,@�/ؔ��#@&���zO@�� 1L'@V�X<�@�O��'@�TM,)@Avz_�*@�%���8-@m�w]��$@dXv{@U(sGF@��t�E&@�no�n�@�V����@�+�ފ@���"'@Ø�h$@s��O	&@�.��'@�_��~,@2��J�(@���%'@��Y�i(@F�Z�"!@����	�'@P����,@��a=�*@IA�D%@-@q����'@��-�1>@,�+�>@;�U9��(@�C��m�@�r��+@�">'@W� 06@h��K��*@p/��{*@�&õh@���F?�+@�R����+@��1�n�+@��ͮ��*@(.;JY�@�0^��(@H��Y�i�?+h&~��@�t�H(@o�	��]-@�{�UL�@fLQ��*@:x��<*@'���,@�52�m:$@~�ކQ�+@��.�Y-@�A�x��#@k �E͕'@������@f`�+ !@�P��if)@�L�K6#@(�yNP�"@��S�)@Z��'@�Cme$@7�1�,@��:a,@����$@d7xf��$@B! m�,@�ٸ�3�+@�)>1k�*@?��r�"@!�J�.@;ȝK�!@N���kI@L(V�(%@��M�L�-@���z�(@�С+@y@�dl�W�@�����@E���h0u@�5Tj���@v3�R#Qu@g1}n���@$6w6��@TP��{@9����~@�T�PR`@r굧et@	]�@U��?H�kB'�P@�v�+j+E@; �[T@�?i�~@��#˨�@m�/ck@�M=mPJ@>��Ԍ�@�7�e@�7�=��v@�j��@��A�lE@�K�ﾁ@�'o=D@���c�f@ �X>s4F@��Z�A�m@>(M&��g@i�c���@�|�5��f@~!��gFd@Y����*"@��z�Ώ+@��7ۖ�,@��4#(@dDp�^%@��]_��+@��r{��*@tc	��@Aa�%@s0 �~"@R:ŀƆ'@#��Np�,@W�Z%
$@�l�g-@�j���#@��y�iW-@g�C(0.@���"@RB���*@"q��ɻ)@����C;-@�u�S�-@ا����"@���nޱ@��T;b�*@�p=Kj(@oe��D%@�	*G�e,@29�]<@4L�o��%@O�p��a@�p�*�@�`7��)@qɉzT-@l���&@;``3o�@�u�p_<@�\�v�'@�gH� j,@G���@4����d"@=���:+@m<����&@���\�&@D�=�Ʒ@�FaY��@��� E?)@��A�t^,@�}R�@&@� ]a�`)@w$[�U@\��*@����;0%@o�3�� @�~� }-@�-A��W(@$
�4��@J�d0�+@�i6
�'@���t�'@����#�!@�/�+�q(@��v�)!@AX>��#@ /�r�+@'��@��׃+@�D�R �)@Mig(��!@�:P�(@�����= @Խ�=�#@��yi�$@Q��n�(@;�-@Y[��� @�G�
@�K[Ǖ�@�z�J��,@��q�5@'{�"@:'{I	{"@ԢƱ]+@7�u��^&@�ȳ�L�*@��fiA�,@LO�(@��܎��@�!����+@E�j��(%@�α�F&@�����A,@��2�V�@��3��4(@Ǽ�p�'@�!Ϟu�@`N�w��(@��Gy��(@'~Ê/h @�	��@I2��8$@���z�%@���M}�$@:�ZF�$@_G��)@�3��\�#@>Df��%@����g�)@�qsl�'@g	��
.@�N@�.@�
�
̱(@�����!@V%�U�'@����&@��֛�[ @Aͺ��/@Z����*.@kR��!@`���7�%@��x�u7-@OKZynG&@Oۈi[,@�y� �$+@�#���c'@���e�*@�s�X�('@K؜�2.@J�ݳ��@34e�,@9:$P�-@o+��")@�9��Σ@r�PS @�Y�)@��ԟ"@ "                  
                                     "   $   &   (   *   ,   .   0   2   4   6   8   :   <   >   @   B               	                                    !   #   %   '   )   +   -   /   1   3   5   7   9   ;   =   ?   A   C          0D   �  �      �      �  �  �     T  d       +��kM        D                           (   "   D                            �   �                                                         ��ԅ��?�����?/�t� �?܏���?�aշ���?������?�(��?�B�&1��?��v�/�?x�-%`�?\O����?�Hz��?���'�M�?�,��d/�?-�q��?�ǈ��G�?#m�6��?s2�YB�?�h/�I-�?       �2��n�@�h���2�          �ڙm��@�~��fY3���{��          rN,��P�@,��E93��>��'�          �iH
�@��~��x0�K>�JZf&�    KK��(�s@       /zdL5�~@�w�F0�       ҍ[�[Hv@��IwSM�       ��]h�u@�<t��       �v!M��m@�x;�z�@       0b����{@3QX('�       Dם���v@�m�U^�       	   ڋ��8t�@>[�T�2���1��K�    	   Y��%��t@}'�����       
   +�;�~C}@}��f�3�J���F@       �m ׮s@��H�j�?    
   /0}k�:t@pZk�l�          �ؒ�Hv�@p`��6I3��R�"=�          e_g�Ł�@N?ԃ�2�O�6���"�       �[���z@۽��#�   (`�9%y@jv �Zw@`\��{w@v	���r@�k�&t@UL�V/s@��_\��r@J��A��n@�e��=�q@��2f��r@ t��q@���ov@c�;r@08���n@�B�߃p@�O���m@�?�4r@����)x@9P�1/�z@�^��yq@ޭc��w@06�T��o@���xxr@u�g��x@R��>^p@�^�p@�����z@���S{o@����|o@����یo@d���tYp@�Y��z@S&���q@���>�~@-gD��7y@D�O�(�q@��aбm@���6�x@�+Y�Hp@�} R�p@��`��>n@��|At@����1To@���ȳ�m@�;���t@��ՙDr@��eA.Bx@�`_�)v@ޤn¶1q@��dS��t@n�%�@u@2��a��p@(�?�#�r@�4Z�Rt@�8�(Cn@F��r��n@CB��rt@����?�s@ޒ,�*wn@���$�o@��;�?Sp@�?vu@S^��l@��e6�u@��e�	y@�	��^�s@�����sm@E8����q@��T�}	x@����v@PmC� |w@����L�r@��I���r@`��3��q@.�;Z�}r@}6e�n@n�q��s@קQ�t@�;�J�Zq@s�sv@�E9D��p@�S�Bs�m@$�g�MIq@뛛�,l@���q@ҫ2�x@����O{@�^�f�p@8��9��x@n��L'q@9�o&�r@=�$&Ex@b�m?Ӽp@t�A�=o@�Z���z@G@�hDq@Tդ��o@��n�o=n@�yQw�p@��&��]{@����q@����v@�"t�=x@"��r@Ι�ԗ7k@iΔ#�v@>�!b^�m@	���l�o@ۃx�3/l@0s�]O�s@:֮-�4p@�?�&��n@Q�LrMs@��<«�s@�9��[�w@�M%�yQu@�J��cp@��ςt@��p�u@��~��op@ut���r@���wv�s@W���lm@]�L6To@��
x��r@':W*s@�����l@����m@]>G�s@�+�.yTv@g�/��j@�Uҝ}�t@�=�%tVx@�(��զr@�.�rƩm@Y��k��r@��uG�yv@6�GYw@��\B2v@����p@��2��q@�_�C�x@�8�UQw@�1��~l@@\<�br@N�L���u@�/���r@Ej�z�{@'ݥח�p@Z<�|6`m@��z�0�l@��*Çj@N`,�s�p@�tcB��u@�!aM0|@�Mᔂ+m@X�amҐ{@aEC�k@���	s@z���{w@>�ًDn@�}ٴ��p@"�#�b�z@Ϥ��q@�*��"l@>�I��r@��
��q@R-��Hy@йę��p@l���mw~@��Wm|@��9hH�r@n�콓p@��$7 {@_+��]o@�Bo�G�n@�� R�r@�f��>�q@��,y_n@�Nc��l@�G36W�u@`�U^�o@)�L�v@<��+�s@��2c:n@���%s@��w�s@B���l@~��R�p@F��2�u@0�#���o@��@��i@`:�>ru@*azCiw@
^���m@�Wo�s@��
X��o@:�:��t@�T��yi@�*s�X?s@��E6E�y@C��w�vv@R�o�vr@`lO[3�q@p	�ku@�*����y@~yYAo�x@�q�|�Wo@K7'�H�r@lcL\�iq@����H�t@C��@`9m@�Ѵ��q@��|0Ar@�b�!G�q@��#W�Ex@�a��(o@����o@dy}0��m@]䧊�l@
� [�	p@6R4x@xct�}@�hp3n@z��%�`u@
	`���q@`V�X��q@"W����{@�#��s@����oms@V�V��y@ԓ�Cdyp@ƛ��B�k@RyI�s@�a�J1�o@20T� �|@3�>@��p@4&���}@��M�Rv@դ�3�s@�LW�ak@:��ޠ�t@L�;�b;p@D�l /q@�͑`��q@o�9���s@�߅ט�s@�����h@MӸ��q@�' T\o@��ĕ�v@6?��`�r@,��
��o@_�����u@k��y^�s@�h�b1�l@�U� t@Ff&�3r@�A��i�n@��z��p@,v�"�vq@�,��^�s@��Z[Y^k@�9����p@�6S���p@��.t@ ei2�i@�7�K�r@�V7�xx@�����_q@̸��n@�9����o@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@KK��(�s@�Os:}�n@dKvm=x@��=�v@02��n@�D¹r@L��X*q@ ]���v@>���q@�,�V�Ks@��
�#s@�G"�c�s@��b! jw@�;1eNo@9����s@rd�p@4~���r@ȇ�_[p@:��J�kt@�!�f&y@�D��t�o@�|���p@d����u@�4�!�r@�$KM��x@���:�jx@���0^w@JD~���s@�S%�^t@#E.WOp@�5"]��x@̿c�er@(o�w@=�}��Wr@��|��s@�}�Q�p@"�#v@�w�K0q@yP%!!p@����s@mDN5��s@@K(=��v@~�]��&s@��Tޏ�x@BG�ҫ�n@�#rw/�o@ˉ����o@�9��q�q@&�c��n@�I۵Bq@~}ӡ�u@X�dnYSr@g�����n@^:s(�u@�6*�p@>,n@qs@�[�nX�t@�,B�A
p@V8
͙�s@c���
�p@���l�t@���|�s@���@��r@��ɞp@����o@�����s@b-�/RRp@d��*�Ts@���&�p@�y��~s@�V�(��t@i�3�ru@��uST�r@�͠�͟t@$�z�fAs@yx~��s@x����s@�;�s@�3��k�r@d_f�@�s@�'wC�pt@�ֳ!�Ns@M��k�s@93L�t@� �@s@��x�Z�s@�	�[mRt@��Qf�t@��2�ks@h����r@W����(t@��>���s@"�Dys@�F:�s@�y�wt@�(u�s@�<�^�t@�'1��s@�#wE:Fs@���3s@�R�ա's@z "��s@�ZyD�dt@K�`�s@�K�C�ws@�S�ls@���Qs@�$j>ns@��S޿�u@�+�s@7Dz��s@�i ��'t@�����*t@���?�s@���3>�s@��=���r@:�Qr�Zt@[Q�'UAu@fv��-Ns@�i�u@��I�p�s@C��h�r@q�6>��s@�$��Pms@��D�s@5��]�bt@�z�het@��|�s@�b�8zs@�%�Z�s@�Aܛ�:s@�Z�`Hs@MX�g$s@-���0�s@ϙ���[t@���-s@�*��s@&�0s@Nu���s@sŐ��s@Uh+�s@���s@��=*b2s@�l��s@�&ʷ�s@ס&�b�t@�/�Ey�t@��ԷO�s@�qW��s@f���U)s@�w&���s@��?S	;t@ 1P)�ps@0�3���s@�7,���s@ly��%�s@D�O#s@Ʒ��t@�n���tt@R��Y�s@�o�CT�s@4_�t@	�2a
_s@���v�s@5~h��t@i�b���s@��t<�s@�Q7�n�s@.��3�s@��v��s@p?�9��s@�7"p@s@(�H��s@F'Cs\<s@���e(s@\����+s@<0#bXos@����Vs@~��Qxs@b)��t@��t�"t@�W��L%s@�T˛�t@�" tpps@��!NZs@��;Q�ms@uO�E��s@�CP4�s@�n�-I�s@ٳ�ot@=Xk'��s@��";ߏs@c�>��s@{��',s@�m� qs@C�?�Bs@�x�_s@־k�=7u@�k�&kt@Iؼ5fs@�җϛQs@?��ds@�7IP>s@}
�@/�s@���qt@�mns@?�tl��t@�扳H�r@^�0�ҏs@�q�`]�s@�D�޷t@b��x��u@\�4���r@��(|��q@Ђ���q@ܲvO�u@��{/��p@c���*Fs@��*!Bs@F�<�Pu@0���(t@��p�h.u@�gC�u@�|�N��t@*-��r@�����ou@r�w���s@��O;#t@o�+��u@ m��
ir@[��7y�t@�F��t@���}q@vOʎ�t@Z!4>�t@d���r@,饹�Tr@��`w3�s@"��s@��抽s@B�'��s@ N(���t@��g>*�s@^/k��t@�}��t@�Z��ņt@z#=B�u@D2OP�u@�(ae�t@�3���r@��Gmt@�V��It@���$,�r@�����q@�=N]��u@a�n=}�r@�A�s'�s@���^}�u@�/͔1#t@�Wetyu@�NlڈCu@���et@�����:u@�)!`Wt@a'6���u@�g�Ir@Au�ןu@y�ܤ&�u@.���t@֓Y@�hr@HFx�lq@�z����t@��pa<r@���5^+q@��y��s@~����r@Wy,IHAr@�2�oHq@.�\y@�m�Q�cx@��Аr@Ϗڀ�5t@&���v@q�t@F "�x@��B)IJr@ţ��YEs@��!#��q@��a�	r@!��v3}r@M�I���q@8T��u@伻#�q@�4��;w@��5K�q@���^]t@@����r@�� ��r@�7�Ct@veX��s@�ȗl�*u@�'�Q6r@���_��v@Aر��ou@�h��yr@�J�K�r@^1��Ts@]g[�v@���4�t@��u@
���I�v@�1V#@s@���BXir@&^R�Htw@J�u�fwq@,j��+`s@�V���Cs@�jp�o'u@��ـq@��=p:r@�>��\q@x6l0��q@��sU�#r@�}߲��q@p1��fq@Ky�
dq@��߿S_u@Ʉ����t@B��>Pwq@�]�	�t@���%�v@{���os@X�a�-	w@n�N>�Ls@k�~�X�r@�_z�;r@~߱@Kq@� Y�kt@z:ߥlv@h6���yw@HFc�'�s@�{b�A�s@457�\t@�vyI�vu@���=s\t@��ۘ5s@��5 B�s@���>7v@��f��s@d�s/�s@�����s@��&*�Bs@/yy�s@) u�Ru@~�?�hs@�Ъ�_�s@v{�� [t@)ܾ5�Mt@�Sw���r@d� �@s@A�M��t@uб�-�s@yP���7s@9Y���s@���gщs@v;,U5�t@Q�y��t@}KV)s@"���"t@��Ɩ��s@+a��/�r@���\ATt@i��s@��oQ�s@h_�7^s@����)s@S2{��r@�pw�Js@v~�6Gt@�ꊅ�@t@h��}�^s@��.47s@��S��s@�*�h�Es@ Y�/8s@�w�Q0t@#s@����r@B5Kǘs@Py�_zt@h�~E�s@a� �t@�(��]�u@1��1s@#�M�it@C���,�t@���Us@0�s8s@T����s@��(���s@���Q;t@���9}t@�JSc�s@�Bt2%t@@��s@�`q�Ss@��>Yt@V��.s@���*�Kt@H,�ʡy@�n~�Aw@/3��kw@�nza�r@H�'�s@)�'�Ts@ @D{sr@�s�қo@�rNT�q@Q�x}or@��r+��q@"ok+�u@�9q��"r@,���n@��&U��p@u����m@(/ÑE�r@=�|�{�w@Q�8�{@��ob<q@F4��/x@�{�i�o@$s���;r@�����x@0gmr�p@�&��xqp@�:Kr��z@�����fo@'��l9p@d��і�n@B�*��1p@%#�n{@��q5��q@�����~@���?�x@Kp��K�q@�?�srm@�VW�t�w@�ȫ��p@�E�D#q@�,f��m@Lr�\�s@�ʆ��n@q���Lm@'��_�dt@u	��"r@-̀��x@i@v���u@��(q@o8���[u@z�o'u@�5T ��p@袕�ar@Xt��s@��Q�n@|l�w�n@l`��t@�Y��s@4��0n@~���{6o@�^�+ap@�q:��t@ا�0�l@�;?�u@��t���x@�45w�s@�U,��m@��M�bq@�u)4et@�� 1H�s@��|s@�C��s@�"-�s@kܤ6�s@�Q��h�s@�#I[�s@�P\�-t@~��x�s@E�O�s@�c`�s@���ͯs@0�'I��s@$���'t@OhZ��s@���C2>t@�M���rs@��ѾSt@k?�@n�s@l����t@��S���s@Ia5e��s@W�8��s@p����t@$��l�s@���x��s@C���)�s@�O)6t@�wP�ns@��$�s@� *å�s@ҩ�+�s@'��"J�s@�g�@Ɖs@Z�{13�s@�m�7�s@��{�ys@�b��|t@�=��s<t@	NT~�ss@��Z��rs@��m�vs@rF)��s@g�%�r�s@��4j��s@৸+t@����s@�8]'��s@` �.�it@�����s@�lr;�s@�rx�s@E>js@��L�s@(����s@dXޓg�s@|X ��s@E�R��s@�r�+ƕs@!mNjb�s@J?Ԋ�s@h8���s@��f�s@�u�=ls@8����s@��YiR�s@����s@\���Qy@|)E6-�t@�(�qx@�#��.�r@�����t@���s@9���Xs@�F-
pl@/�9w�Lq@GFMX�r@�Cd�Kr@�Y�}��v@�$J�Fs@����.o@��q���p@�:�0 o@����Br@��W&j�w@C�̻{@���c~0r@�	m�x@���qDo@6��ZBs@�`�B�y@4�4}�m@��le��p@֒:�ַy@�2��p@D:���j@bX�S��n@J��#�o@uk�3l3z@��S��vr@P��M1�~@" �Dy@�c�|{�p@���r�g@�.d���w@a&Be�:n@9̤�uq@�.!�Vi@��~�Ľs@�.���o@Tݔ%Z�m@$����s@:�'�Uq@R���mgy@#J���v@�_z��q@	I�P �t@=;Jm�s@��_��Lp@^>��Ms@��6p(t@�ܣ(j@��n�Xxo@�5K?s�s@�p�!Kcs@r}GH��k@��-^�p@.*1T��p@�	)��u@������f@���O�Kv@ъ�)y@�=����t@���]n�l@҆D�/q@."�A6�s@���1�s@�M���s@�1R&�s@��F'�s@������s@��s �s@�?iW�s@Tl*c��s@*�z���s@�@���s@*�b��s@�����s@����p�s@'ᤓ��s@뗐ϕ�s@�8�V��s@?:i�t�s@>�����s@��9�U�s@H�����s@���s@WK��)�s@o��jD�s@Ѕ���s@$ �y�s@������s@����q�s@�u���s@-л�t�s@X����s@#�"�.�s@�s	���s@��e`�s@w�JN�s@뗭d[�s@\� �v�s@Dx� �s@RR���s@'<�W��s@Z�k�ܺs@���O�s@x�y���s@p����s@�K|���s@�/O�s@��J�3�s@m���s@��G���s@E9f�u�s@pE$��s@�uԢ��s@�ۆ��s@B5�s�s@:Cf��s@u�r���s@�_�s@�Z����s@E�{P��s@dsc%�s@�� �G�s@ǨX�s@�Cֽ�s@�m�B�s@zgt�-�s@�-#l��s@��ؔ#�s@{"����s@ �J���s@w����t@���%(�s@bWE H�s@������s@LAG�s@\6����s@������s@aX�n��s@��"�V�s@{R����s@P;���s@�& ���s@�5)%��s@�%�T*�s@O	��3�s@ɞ�?�s@R����s@��׉�s@G*���s@��c^�s@��n��s@KH��s@��弲s@���*��s@�<l�׿s@��5���s@)u�a�s@pX�Wt@������s@���W�s@N9��s@��LP�s@������s@��S��s@qO{���s@�B<��t@�f�R�s@��.T��s@|J}��s@)X�hft@5�D�~�s@q��_�s@��[� �s@~V<I�s@���z�s@�D�_��s@��N��s@d47�s@Ǵ�X�s@A̤(��s@^�����s@��s��s@��7E��s@Cc.t@�^uj��s@�,/���s@;�q�s@R�RB��s@^�2�b�s@
m��]�s@�ڑ�q�s@�2�V"t@�
h�g�s@�JN���s@0���Եs@����s@�^���s@g�Li4�x@�_9W�v@�pC�w@��@L�s@�����u@;�GX��r@ax�n|�r@�x.��n@F�?qjr@+!����q@[����wr@[���v@_1Rc��q@��d�m@�V)f�p@�ZDm@�����r@��\2�w@�bCXz@}��	�Bq@��dq�w@�4�Ro@����q@F����Kx@��?�0p@`���&p@��D�xz@?��Ιo@�3�cp@/�'�Np@,�`��p@O0��-{@�(�@�q@��}b�@��4��x@|���hq@�,u�W�m@�Q1��w@�{�jq@�M��lp@������p@�^�|B_u@���p��m@`ٱحp@�2�3�t@�f��"Es@��A�jx@֟��-�u@3�����p@�G�0�tt@"��u@��G˚p@3���r@�@��֭s@�C6m@`(X<�m@�r:/u@�R�0l�s@���v�n@�l!"q@�̃��o@���,u@�:�~�l@GN��)�v@��k��Jy@�7c-�t@P*��T o@䚱��sq@�Yt���z@ �5�v@b�M��u@
���Jr@״����t@SÉR��q@����q@{�'<�q@\���Gr@���)�s@��mn
�q@��7xt@5��"E-s@;y>P�j@O�&~}q@Jĝ,�Fj@ce6+p@��B*�y@Eѻn�y@*��a�p@�Ƹ&�:v@��5l@,/ݨ��s@��E7{@[۲!�n@v��m7p@B�]�tV{@)��yl@O����q@L�RO�8p@�i;D�t@.��ɥ}@�p.�p@�<uJ�}@�O
�y@��-�zt@�I	��q@M�)�w@�n`&�m@ݵ;1�cs@qPҫ��p@D���s@Μ��v�o@���q�n@�7��8�x@������t@^GdU��w@�Pɻ#�t@�IO��}q@0�X�9t@I=���`y@��)$p@3e��C.s@�J|�1v@h>3B�j@Z��d!=n@3�RoRx@ΔEQ��r@
~�Pn@V���c(o@���oS�q@m�>��t@0}�I3p@*}f>
w@2�r��w@���\�x@��F��j@�vzz�p@^�պRu@:(�r��r@��!�28r@Ϸ����s@�]*�q]t@[?�`ir@>:��r@���6	v@� <�Uxt@e(�t�8u@P;QLh�s@�<g+r@u��l��t@8�F�q@�����t@��=>��q@\Tgs9�q@��l�Xu@���Z�r@Zk���s@�C�Wr@_H���q@����|,u@�V���Ov@N͞{�r@BXe�yts@\���dt@�P�Dr@�|��v@��Ȫ�?t@��	\&x@����j�v@!I�P��r@�!}���q@U�C~'t@�F�xv@R�l�3�v@���)�s@GL1�Br@�Q)��sv@7��@u@�H�OO�r@P*��s@Q�A�s@�.��w@ذ�M/v@��"�4s@�y�BEFr@Q�)��t@C��E�*s@��/�%(x@&+�
�r@m"�kt@Go]еu@�gKǭ�q@�v��zs@��l�x@��$U�|r@f�OC�s@���hE�s@����pu@T�k�Qrs@>��HΞu@,��3�u@B���hr@<�{�cy@6l ��r@R_*��r@  