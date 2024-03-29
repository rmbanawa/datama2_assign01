PGDMP          4            
    w            myDB    12.0    12.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24605    myDB    DATABASE     �   CREATE DATABASE "myDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "myDB";
                postgres    false            �            1259    32789    client    TABLE     �   CREATE TABLE public.client (
    client_id integer NOT NULL,
    client_lname character(32) NOT NULL,
    client_fname character(32) NOT NULL,
    client_address character(64) NOT NULL,
    client_phone numeric(11,0) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    32787    client_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_client_id_seq;
       public          postgres    false    205                       0    0    client_client_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_client_id_seq OWNED BY public.client.client_id;
          public          postgres    false    204            �            1259    32781    purchase_order    TABLE     Y  CREATE TABLE public.purchase_order (
    purchase_order_id integer NOT NULL,
    print_method character(50) NOT NULL,
    print_material character(50) NOT NULL,
    print_color character(50) NOT NULL,
    print_size character(50) NOT NULL,
    print_quantity integer NOT NULL,
    print_design character(120) NOT NULL,
    date date NOT NULL
);
 "   DROP TABLE public.purchase_order;
       public         heap    postgres    false            �            1259    32795    client_purchase    VIEW     O  CREATE VIEW public.client_purchase AS
 SELECT client.client_id,
    client.client_lname,
    client.client_fname,
    purchase_order.print_method,
    purchase_order.print_material,
    purchase_order.purchase_order_id
   FROM (public.client
     JOIN public.purchase_order ON ((client.client_id = purchase_order.purchase_order_id)));
 "   DROP VIEW public.client_purchase;
       public          postgres    false    203    205    203    203    205    205            �            1259    32779 $   purchase_order_purchase_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.purchase_order_purchase_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.purchase_order_purchase_order_id_seq;
       public          postgres    false    203                       0    0 $   purchase_order_purchase_order_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.purchase_order_purchase_order_id_seq OWNED BY public.purchase_order.purchase_order_id;
          public          postgres    false    202            �
           2604    32792    client client_id    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN client_id SET DEFAULT nextval('public.client_client_id_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN client_id DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    32784     purchase_order purchase_order_id    DEFAULT     �   ALTER TABLE ONLY public.purchase_order ALTER COLUMN purchase_order_id SET DEFAULT nextval('public.purchase_order_purchase_order_id_seq'::regclass);
 O   ALTER TABLE public.purchase_order ALTER COLUMN purchase_order_id DROP DEFAULT;
       public          postgres    false    203    202    203                      0    32789    client 
   TABLE DATA           e   COPY public.client (client_id, client_lname, client_fname, client_address, client_phone) FROM stdin;
    public          postgres    false    205   :                 0    32781    purchase_order 
   TABLE DATA           �   COPY public.purchase_order (purchase_order_id, print_method, print_material, print_color, print_size, print_quantity, print_design, date) FROM stdin;
    public          postgres    false    203   �                  0    0    client_client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_client_id_seq', 1, false);
          public          postgres    false    204                       0    0 $   purchase_order_purchase_order_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.purchase_order_purchase_order_id_seq', 1, false);
          public          postgres    false    202            �
           2606    32794    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (client_id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    205            �
           2606    32786 "   purchase_order purchase_order_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (purchase_order_id);
 L   ALTER TABLE ONLY public.purchase_order DROP CONSTRAINT purchase_order_pkey;
       public            postgres    false    203               i   x�3��/��L��S�8���q�+p�&f'�d*8g�T�1�4426153���2��J�ū:$?'5�$3/������J�{�q�=�F�@�XZ�s��qqq �>3         a   x�3��I,N-R(��+��S 
p�9+g������)'19['<#�$�X-F�y

`�H-��)�ř�yz)iD;�* �\CK]C ����� �k7�     