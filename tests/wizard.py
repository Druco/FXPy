import os
from FXPy import *

wizardimage = "47 49 46 38 37 61 80 00 88 01 a5 00 00 00 05 ff \
  00 0a ff 00 0f ff 00 14 ff 00 19 ff 00 1e ff 00 \
  8e ff 00 89 ff 00 84 fe 00 ff ff 00 f9 ff 00 f4 \
  fe 00 7f ff 00 ef ff 00 7a ff 00 23 ff 00 ea ff \
  00 75 ff 00 e5 ff 00 e0 ff 00 28 ff 00 70 ff 00 \
  db ff 00 d6 ff 00 6b ff 00 d1 ff 00 cc ff 00 2d \
  ff 00 65 ff 00 c6 ff 00 93 ff 00 c1 ff 00 bc ff \
  00 60 ff 00 b7 ff 00 5b ff 00 32 ff 00 b2 ff 00 \
  ad ff 00 56 ff 00 a8 ff 00 99 ff 00 a3 ff 00 9e \
  ff 00 38 ff 00 51 ff 00 4c ff 00 3d ff 00 47 ff \
  00 42 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 \
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
  00 00 00 00 00 00 00 00 00 00 00 00 00 2c 00 00 \
  00 00 80 00 88 01 00 06 fe 40 80 70 48 2c 1a 8f \
  c8 a4 72 c9 6c 3a 9f d0 a8 74 4a ad 5a af d8 ac \
  76 cb ed 7a bf e0 b0 78 4c 2e 9b cf e8 f4 38 c0 \
  6e bb df f0 b8 7c 4e af db ef f8 bc 7e cf ef fb \
  ff 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e \
  8f 90 91 92 93 94 95 96 8c 02 99 9a 9b 9c 9d 9e \
  9f a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 aa ab ac ad ae \
  af b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 ba bb bc bd be \
  bf c0 c1 c2 c3 b9 03 c6 c7 c8 c9 ca cb cc cd ce \
  cf d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 da db dc dd de \
  df e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee \
  ef f0 e6 04 f3 f4 f5 f6 f7 f8 f9 fa fb fc fd fe \
  ff 00 03 0a 1c 48 b0 a0 c1 83 08 13 2a 5c c8 b0 \
  a1 c3 87 10 23 4a 9c 48 b1 a2 c5 8b 18 33 6a dc \
  c8 b1 e3 c4 02 20 43 8a 1c 49 b2 a4 c9 93 28 53 \
  aa 5c c9 b2 80 01 03 07 62 1e 40 80 a0 a5 cd 9b \
  38 73 ea 6c 09 53 26 fe cd 9a 3b 49 26 18 aa a0 \
  a8 82 05 41 93 2a 6d 29 73 26 4d 06 4b 43 12 35 \
  ba 00 69 d4 ab 58 41 fa 7c 0a f5 6a 02 a3 47 ab \
  66 1d ab 74 2b 02 06 68 b1 82 ad 2a 96 ac db 9c \
  31 7f a2 4d 7b 95 2a db 06 6f f3 32 75 7a 76 ae \
  03 b5 61 ab 36 18 ac b7 f0 c9 b8 5c d1 3a f8 bb \
  f2 81 e3 c7 90 21 07 5e 30 78 70 e4 cb 98 33 6b \
  de cc b9 33 67 c4 7d 15 2f f6 4c fa 01 5b ca 95 \
  21 94 5e cd ba 75 67 d0 73 19 2c 1e ed 3a f3 dd \
  d4 10 54 d7 de cd fb 35 df d8 b3 1d 44 e8 1d 59 \
  30 ee dc c4 93 2b 87 ed 77 76 84 e1 ca 4d 57 6e \
  90 bb ba 84 e8 d8 59 9b 05 ee fc 39 f6 e9 d5 73 \
  4b 18 9f bd fc 67 e6 a2 17 3f f7 1e fd b8 f8 f1 \
  12 26 98 9f 0f b9 a9 dc e6 ea d7 43 ef 4c a1 bf \
  ff ff ff 0d 16 1e 04 f0 c5 37 01 80 08 26 a8 e0 \
  82 0c 36 c8 a0 7d 89 c9 d6 dd 7a 15 38 68 a1 7f \
  d4 85 57 e0 04 1c fe 5a 70 e1 87 20 86 d8 1f 84 \
  a1 49 98 1f 85 15 8a b8 e0 80 1b 76 68 81 87 2a \
  c6 28 63 4f e8 99 28 9c 7e 15 e4 28 63 82 1a c2 \
  c7 e1 04 2f be 78 c1 8e 44 5e 48 e3 6f f8 dd 88 \
  a2 8e 45 fa 67 9d 8f 2e 0a 79 c1 90 4d 56 f9 df \
  4b 24 72 77 e2 73 39 e6 88 81 95 14 bc 37 de 8f \
  41 5a 30 e5 94 19 64 00 66 93 58 6e 97 a4 7e 11 \
  74 59 01 06 5f 5a 49 20 94 40 06 79 e6 05 69 a6 \
  b9 e6 8c 6d d6 18 1c 9c 72 d2 59 67 95 2d e6 29 \
  25 9a 7d 66 a0 c1 9f 22 be 74 e4 7d e9 29 c9 65 \
  97 86 1e da e0 06 9c 76 ea a9 a7 78 96 b9 67 a3 \
  8e 6a a0 c1 a7 a8 a6 aa ea aa ac 4a 3a 69 84 83 \
  e2 88 a9 a1 1c b0 6a 6b aa 63 46 69 e6 99 a4 9a \
  6a 6a 07 1d dc 2a ec b0 9d ba 9a e5 9b b2 7a 49 \
  6b ad c4 de 6a a0 a2 bb 32 da a7 af 1a 00 0b 6c \
  b3 d8 a2 ea 81 b1 6e 56 4a e8 ac 74 72 20 6e b6 \
  ac 92 a9 27 af fe 8d 52 6b 6d 07 1f 7c 40 6e b6 \
  db 4a 7a ac b7 c9 ce b9 ec b8 ef a6 aa eb a8 e9 \
  fa ba 6e bb 1f 80 90 af b0 1e c4 1b 28 92 f4 2e \
  69 6f b8 e2 72 10 c2 c0 a8 42 cb ef b4 fe 5a 0b \
  30 08 18 43 bc 6a c1 dc 0a 3a e1 a5 ca 32 2c 6e \
  08 0f 6b dc a9 a8 e8 52 fc ab c5 ed 62 8c b1 08 \
  22 98 ec 29 c7 f2 76 6b e3 b7 21 63 d0 b0 c3 24 \
  cb cc e9 b9 d2 a6 a9 2e cb 01 bb 0c 33 cc 32 17 \
  6c f0 ab 25 c6 aa 70 a6 3b 93 1c c2 08 c3 92 60 \
  f5 d5 58 63 bd 28 9f fd 5e 4d b4 cb 20 1c 2d 42 \
  09 25 64 6d f6 d9 66 2b dd 31 c2 37 d7 0b 75 c3 \
  52 8f 30 02 da 74 d7 4d 42 b4 5c 4f 8b 76 cb 46 \
  1f 4d 36 d9 76 d7 ad f4 d2 f3 b6 fd f4 bd 3c 4f \
  2d 77 e0 8c 5f 3d b1 d0 75 83 2d f6 df 64 9b d0 \
  78 d6 83 af 4d a9 e1 20 2f ac 33 dc 24 cb bd f8 \
  e5 81 a7 0c 79 e0 61 fb 4d b9 09 ac 5b de f8 e0 \
  84 db ec 74 fe e7 6f 8f 1c ba e8 27 90 5e 7a de \
  42 6b d0 b8 ea 7f b7 6e 02 0a 28 30 0e bb e6 b0 \
  7e 1c 27 b8 9f db ae b8 dc 27 e4 ae 7b dd bc 97 \
  4a fa d8 ab b7 4e 3c f1 75 a7 70 7c cd 1e 6f b9 \
  7c ce 51 df 0e 7d f4 d3 d7 dd ab a9 ba 67 cf fa \
  f6 28 a8 a0 02 da de 67 0e 3e db b3 8f ef 79 f9 \
  cf 8f 10 3d fa e9 43 5b bf d8 37 bd 12 08 0f 7e \
  f2 53 c1 0a 56 80 b5 14 d4 4f 6d f7 db 5c fe 0a \
  85 b8 b8 e1 ee 7f d2 0b 1c 0b 36 c8 c1 0e 76 50 \
  65 d5 f2 a0 08 47 b8 41 ed 6d 2f 81 0b 5c e0 06 \
  1d f8 bd 83 49 50 79 14 14 19 07 3a 78 c1 ff b5 \
  80 84 38 cc 21 0b 7a b7 32 1d e6 70 78 27 94 5f \
  0a 57 e0 40 16 da cf 85 c9 13 5f 0c 9b 27 c2 f3 \
  d9 f0 86 3e 8c e2 06 4b b5 b2 0e 48 91 84 41 54 \
  60 0a 8b f8 40 9a 21 b1 69 30 64 9e b8 70 88 c1 \
  13 b4 e0 8c 57 8c e2 d0 80 95 46 12 a2 70 8b 45 \
  6c 21 d3 fe b4 64 29 fd bd 2d 87 18 3c 23 1a db \
  98 c3 8a b1 91 8f 23 d4 e2 02 b9 28 c7 c2 4d 50 \
  8c 33 c4 63 f4 f4 d8 02 17 00 f2 91 90 dc 20 1c \
  8d 08 c1 2f d2 11 67 fb 8b e2 22 f5 e8 02 47 46 \
  f2 93 6d 24 62 1c 8f 38 47 64 1d 2e 5c 52 34 23 \
  27 3b 09 ca 56 46 51 94 94 f4 62 29 13 46 3b 43 \
  a5 91 91 9d 64 65 14 5f c0 cb 5e fa f2 97 c0 0c \
  a6 30 87 c9 4b 58 76 31 76 e1 ab e3 12 89 29 cc \
  33 e6 d2 05 30 60 a6 34 a7 49 cd 61 0e 72 94 95 \
  9c 25 e7 ec 48 a7 6a 7a f3 9b e0 0c e7 35 63 89 \
  4c fc 85 31 64 e1 4c a7 3a d7 59 cc 71 1e 13 79 \
  60 54 e2 ac d8 49 cf 7a 4e 73 92 ef 8c 60 12 95 \
  39 4f 7b fa f3 97 45 7b 99 08 c0 39 44 42 92 d2 \
  90 e7 b4 d7 3f 17 da 4b c9 1d cd 9b 05 c5 a6 2c \
  11 2a 4f 2f 31 f4 a2 2f e8 1b cc 4a 40 4d 41 1a \
  b3 90 b2 4b 28 06 30 fa cd 18 98 f4 a4 28 45 a9 \
  40 37 fe 5a 82 94 ba d4 a4 1e 35 68 36 29 ca cf \
  1c bd f4 a6 38 cd a9 4e 77 7a d3 d4 b1 b4 a5 3a \
  8d a9 44 cb f9 c2 8a da 8b a7 48 8d 01 0c 60 70 \
  d2 5e 26 95 a7 93 fb 5b 4e 85 88 4f 90 26 13 93 \
  99 7a aa 4e 99 6a 52 5f 6a 55 a7 c0 23 1b 4e a9 \
  ea 4e ab 9a d3 a8 6f fb aa 4e 7d c9 02 b5 e2 f4 \
  a7 95 7b e9 1b cb 7a d0 90 a2 b5 82 6e 75 29 5b \
  db 9a 57 97 62 2f 78 ac 4b e9 5c 3f 5a d7 ab ba \
  ad 82 24 eb 6b 57 7b c9 41 c5 a6 94 72 06 34 21 \
  f1 06 2b d3 89 da b5 a6 fb 03 9d e2 fa ba d7 0d \
  22 75 a9 a0 0d ad 68 dd 07 c4 c9 92 95 b0 33 bd \
  2c a1 40 5b bb c4 89 6e 04 a2 8d ad 6c 41 cb d8 \
  0e ce f6 b6 b8 85 01 60 df 97 c5 88 92 13 9e 97 \
  c4 51 6c 9b e7 da 1a e6 76 b6 bc f4 20 09 8e cb \
  5c d0 56 4e b2 f1 3b 6d 65 89 ba cf d5 ca 56 b3 \
  af 2d 63 73 43 fb 02 e5 2e 77 bb c7 8d 2c 6f 4d \
  2b fe d4 df ea 33 9e 75 cc 6d 71 9d b8 49 f0 76 \
  b7 83 57 03 ef 71 0f d8 db aa 16 f6 ac e9 3d ae \
  f9 fc 97 47 3d 6e d7 bb 56 93 6f 6e a1 4b d9 a1 \
  02 d7 94 11 90 6f 0d 37 e9 cc 4e 1e 17 c0 24 d8 \
  80 80 71 3b de e8 96 37 9f 96 44 f0 84 f9 fb c4 \
  06 3b 38 b7 f0 bd 1a a7 26 7c db d2 5a d8 b7 18 \
  d6 a6 d3 48 bc d4 fe 7a 18 9a 20 e6 20 d6 3a d5 \
  dc 67 da d8 c6 08 94 ae 81 cf 1b dc 08 dc f8 c7 \
  40 ce 25 83 1b 99 cb d0 9e f4 99 10 f6 54 90 97 \
  1c e4 fa d2 35 b5 86 f5 31 93 a7 dc 49 5c 16 19 \
  b4 4d ad ad 8c 45 dc 29 0a 50 f9 cb 2e 20 2f 8a \
  cd 5a d4 1b 81 19 cc 44 fe f0 52 b3 9c dc 10 5b \
  cd 53 fd 39 f3 94 4f 6c 5f 28 e3 f7 39 72 ce b3 \
  91 17 db e6 2d bf b9 cb 71 ce 73 90 0b 6c de 0c \
  7b 4b d0 72 de 73 0c 3a bb c1 19 03 3a d0 88 be \
  b1 8e 0b ad 62 e7 44 fa cc 58 e6 f3 7b fd 1c e1 \
  fe 47 53 e0 01 97 96 f4 98 ef 5b e6 50 e7 99 cd \
  9b 6e 34 97 39 f5 1f c7 98 fa 99 a3 b6 73 a9 5f \
  2d e7 45 6b 59 d5 7f 66 b5 7f 1e f3 65 46 fa da \
  d7 75 b6 6c 32 7f 4d ec 62 1b fb d8 be be 35 0b \
  1c ad eb fe 3c a6 00 c8 8e 36 b0 51 2b ec b3 4a \
  fb da d8 fe 75 aa 97 bd ea 0d b4 da 31 20 c9 76 \
  b4 a9 4d dd 78 8a fb dc d9 e6 34 9c 77 0d ee 70 \
  a3 bb d8 d3 3d b0 68 de 4d 6f 69 73 3b d7 de 66 \
  f7 03 44 52 ef 5f ef d8 d0 12 ea b7 c0 8d dd ed \
  6f ef 9b df 03 3f 23 a5 0d 99 f0 86 ff ba d3 cd \
  fe 74 bb 43 42 00 87 a7 98 e1 0e cf b8 1e 3d fd \
  6c 91 cc c3 e1 64 86 95 c6 47 7e c6 7c 3b 7b e2 \
  20 a1 c7 b5 cb c8 f2 ff 91 3a 42 2d 8f b9 cc 67 \
  4e f3 9a cb 5c df 23 a9 87 cd 77 7e 02 59 c3 9c \
  e7 40 0f ba d0 4f 20 f1 83 53 9c 1e 03 18 ba cc \
  ab 4d 29 a5 3b fd e9 31 47 79 01 ea 61 0c a8 fe \
  97 b1 dc 73 b1 ba d6 ad 9e 73 a4 57 7d eb 27 38 \
  30 d8 c7 ee f4 a3 cf 03 19 63 e7 31 03 c8 ce f6 \
  a1 4f dd eb c6 10 40 da 4b d9 f6 ba 03 9d ea c7 \
  c8 44 da 8f 65 f7 be ef fc ec 79 d7 bb cd 5f 4b \
  78 c2 1f ab f0 88 4f bc e2 17 cf f8 c6 3b be f0 \
  04 40 c6 26 1e ff f8 6e 51 fe f2 98 cf 3c e6 03 \
  9f 89 00 68 5e f1 e8 f9 bc e8 47 2f fa b8 6b 82 \
  0d a4 37 fc e6 52 cf fa d6 2b 7e 00 9b 68 83 eb \
  47 20 c1 d9 db de f5 b1 97 bd eb 93 77 fb de 93 \
  fe f4 6d 00 c0 ec e3 e9 fb e2 6b be f3 c1 17 be \
  eb b5 64 fc e6 63 de 0d 43 78 bc d4 a6 4f fd ea \
  5b ff fa d8 cf be f6 b7 cf fd ee 7b ff fb e0 0f \
  bf f8 c7 4f fe f2 9b ff fc e8 4f bf fa d7 cf fe \
  ec 57 8b 68 7c 7b 59 fb e7 4f ff ee f3 f0 fd c0 \
  02 58 fc 7d fa d7 fa fb 9f fe 03 84 7f ec a2 7f \
  0e 05 57 da f3 7f 08 48 7e 41 b3 46 03 78 fe 31 \
  1a f5 57 e2 85 40 09 58 7d 3b 53 81 16 78 81 18 \
  98 81 3b f3 38 0c a8 7f 01 c5 7f ee 93 63 f2 a3 \
  81 24 58 82 26 78 82 28 78 81 7b c2 3b 1d 48 80 \
  0f 18 82 59 44 55 29 38 83 34 58 83 18 88 37 2c \
  e8 47 0d b8 7f 51 f5 5c 26 96 40 d2 65 83 42 38 \
  84 24 b8 35 39 58 45 3b f8 81 3d 18 81 31 78 61 \
  44 f8 84 4f 68 84 01 f8 2f 2e b8 52 10 48 60 40 \
  38 6a 50 b8 85 33 08 34 0b a8 83 1e 58 80 57 58 \
  61 40 78 61 99 c3 85 68 a8 81 5e 78 84 02 18 86 \
  2f b8 5b 22 38 69 5d 24 29 69 58 87 0d 83 32 a6 \
  d3 82 0e 68 85 30 48 5e 72 48 4a 06 50 87 99 32 \
  88 84 58 88 86 88 87 5f 88 84 6e c8 87 70 d8 84 \
  b1 b6 34 34 62 88 92 38 89 94 58 89 85 88 88 6c \
  48 85 7b 08 82 8d e8 87 66 98 4d 93 62 89 a2 38 \
  8a 96 88 89 53 08 7f 4a 18 56 58 48 68 73 08 4f \
  a4 f8 8a b0 48 27 a6 08 42 9a c8 83 aa fe 48 86 \
  59 18 6c ae c2 34 67 11 8b be 58 89 b3 78 7f b5 \
  98 8a 06 88 8b ac 08 88 24 12 1a bf b8 8c 84 18 \
  8c 54 d4 86 55 c8 89 3e 18 87 9f 28 4b bc 18 1b \
  cc 98 8d 18 e0 8c 7a 68 8b c5 f8 83 b9 f8 64 90 \
  98 8c dc a1 8d bf c8 8d 60 18 8d 4b b8 8a 7f 08 \
  8a e4 98 24 cb 28 27 f2 38 8f f4 88 8e 8a a8 8e \
  b7 08 8e c7 e8 8e 66 81 5e c2 41 8f 00 19 90 02 \
  09 90 f6 08 8d 9b b8 8e c6 d8 8e d6 f8 8e 95 72 \
  23 03 f9 90 10 39 8f 6b 78 8a f9 87 8f df 48 8d \
  8f b8 8b 0c 69 23 96 12 91 1e 39 90 13 49 8b a8 \
  28 86 7d 68 61 0a 39 8e fd 48 47 1d f9 91 2c 29 \
  91 52 28 92 15 79 90 f9 88 91 ba 08 4f fe 58 2f \
  2d 99 93 2f 29 8c 23 f9 86 d3 e8 88 35 79 5e 37 \
  f9 34 39 c9 92 3b f9 8c c3 48 92 9d 68 92 d5 88 \
  92 a0 31 94 b5 54 94 1f 89 83 14 99 84 4a f9 93 \
  9e 98 91 36 a9 92 87 45 27 2c 09 27 fe 60 09 96 \
  54 09 93 56 e9 93 91 15 96 68 89 96 5b 99 24 2b \
  49 3e 69 f9 96 70 a9 1f 2b 58 95 8b e8 53 71 79 \
  97 77 f9 13 50 c9 4d 22 83 97 7e b9 1e 73 49 96 \
  8b f8 97 84 89 97 6c d9 95 c4 55 98 78 c9 81 e9 \
  78 31 8a f9 98 7e f9 31 4b 54 81 21 00 99 69 c9 \
  98 f7 d8 2e 96 b9 99 85 39 99 e5 c3 99 60 99 87 \
  e9 08 9a a4 89 97 9e a9 59 a5 09 98 99 68 31 a9 \
  d9 9a 70 49 3e fc 33 35 a9 99 88 6d e8 9a b6 f9 \
  96 88 93 38 8a 83 97 c1 d1 9b bd b9 9a c0 e2 9b \
  c2 39 9c c4 59 9c c6 79 9c c6 49 5c ba 29 3a c8 \
  d9 9c 0e 50 95 ce 19 9d d2 39 9d c6 a9 59 fd 43 \
  9d c3 09 9d d8 b9 9d dc e9 9c cb 79 41 dd 39 1b \
  64 19 9e e4 59 9e be 69 41 4e 54 9e 3c 19 9c e6 \
  d9 9e e5 b9 5f 36 a4 9e 0c e8 9e f4 49 9e d9 b5 \
  49 e5 39 9f f5 b9 9f dc e9 44 7a 44 9e 1d c8 9f \
  02 4a 9d 1c c6 48 c8 19 1b 08 3a fe 17 60 98 a0 \
  0c da a0 0e fa a0 10 1a a1 12 1a a1 43 d6 49 13 \
  fa a0 f7 78 a1 1a ba a1 1c da a1 59 67 65 2e e0 \
  a1 b1 61 90 22 5a a2 26 5a a2 20 1a a2 26 aa 89 \
  27 da a2 2e 7a a1 2f 06 03 27 0a 7f 2f 5a a3 36 \
  9a a0 69 06 63 33 9a 84 37 da a3 36 fa 4c a0 35 \
  a3 61 e8 a3 44 da a2 57 b6 54 27 ea 86 45 ba a4 \
  22 aa 66 48 0a a1 7a 19 a5 3f 51 85 52 5a a5 56 \
  7a a5 58 9a a5 5a ba a5 5c 0a 63 58 c6 a5 58 ba \
  89 60 3a a6 64 5a a6 66 1a a5 a2 65 52 67 aa 97 \
  3c b8 a6 6e fa a6 70 aa 68 70 9a 8a 70 5a a7 76 \
  0a a6 99 a6 a6 6f 5a 80 77 da a7 7e 2a a5 6b d6 \
  54 70 fa 80 7f 5a a8 7d 1a a8 8b 35 a8 9c 68 a8 \
  8c fa a6 5c c5 67 5a da 14 92 2a 13 d2 38 a9 96 \
  7a a9 98 9a a9 9a ba a9 9c ba a9 28 e5 4b 9d 9a \
  a9 4b 18 aa a4 5a aa a6 7a aa 31 f1 a9 8c 85 aa \
  92 5a 8c ac fa aa b0 8a aa a8 fe c6 02 b1 1a 13 \
  63 68 02 b5 9a ab ba 6a a9 b3 4a ab b5 0a 83 bb \
  1a ac ba aa 69 1c 94 ab 4b 29 ac c8 ca aa c4 5a \
  ac bf ca 84 a6 95 ac d0 1a aa cb da 68 ba ca 8e \
  d1 7a ad 98 3a ad dc c6 a9 bb d8 ad 92 92 90 0a \
  e4 ad e2 3a ae e4 5a ae e6 7a ae dd aa ad 56 83 \
  ae e8 aa 8f 64 c5 ae f0 1a af f2 ea ad bd 8a 6b \
  f3 3a ae 34 39 48 f7 ba af fc 2a ae f5 7a 6f 24 \
  d0 af dd 9a 95 f8 24 b0 06 2b af aa da 67 00 7b \
  b0 ae c2 94 b1 c6 b0 10 2b ae 8f 6a 6b 0a 9b 35 \
  11 6b 00 65 a8 95 17 0b b1 79 4a b1 a9 96 35 1b \
  b0 b1 fb b8 90 1b bb af 69 fa af 20 5b b2 27 a9 \
  91 3e 51 b2 e8 ea a4 13 cb 68 20 1b b2 ec 0a 3b \
  36 6b b3 1a fb 45 a1 71 b3 3c db b3 3e 5b 30 31 \
  aa 68 1e eb 66 b9 f6 b3 46 eb b3 41 a9 b3 5c 19 \
  01 47 db b3 05 ba 4a 30 9b b0 1f cb 6c 4d 5b b5 \
  38 5b 59 2c fb 94 4b 5b 4b fe 32 f4 9d fe 09 b5 \
  5e 8a a8 43 cb 69 10 b7 01 56 7b b6 05 83 b5 6b \
  d9 90 88 49 99 e8 f9 b4 41 db b1 32 cb 6c 66 8b \
  b6 68 1b 4b 59 cb 17 7b 79 9a ce d3 3f 1d 96 a3 \
  27 ab ae 74 4b 01 76 7b b7 c8 98 92 87 79 4a ca \
  39 7d f7 a9 4a 71 2b b6 73 5b 70 85 3b b9 4e a9 \
  b7 5b cb 97 8b fb b6 7f 0b a4 42 1b b9 f8 d6 1f \
  94 6b b7 79 ab 97 97 cb b7 5e 0b b7 80 db b9 b7 \
  36 b3 ba 56 b8 5c f4 ba b0 0b bb a3 5b 66 6d 99 \
  59 d6 d9 b8 29 1a b8 63 8b 6b 9f 4b 01 b1 fb bb \
  c0 1b bc c0 2b 94 a5 8b 48 b7 5b 43 b9 ab ba 15 \
  3b b8 fd 21 bc ce fb bc bf 7b 8d 89 cb b5 99 0b \
  9f 15 7a a4 90 bb ba cc eb bb d0 db bd de 8b b8 \
  6c ab b8 6e 6b bd 8e 9b ba 72 ab bd 05 d7 bc de \
  bb be d0 6b b9 d3 8b b9 e3 eb b7 d7 1b b5 28 bb \
  bd ec 7b bf cf 4b bb 6d 1b 9b b8 0b b6 ba eb b9 \
  65 eb 1f f8 3b c0 c2 bb fe b7 c6 db b7 fd fb b8 \
  31 8b be bd ab be 04 fc c0 b0 fb be a6 cb b8 c8 \
  eb bf ca 3b b5 e9 eb c0 0f 3c 44 1c dc c1 1e ec \
  c1 1c b9 bf c7 fb b5 0a 2c b5 44 1b c0 fe f1 c1 \
  2a bc c2 2c dc c2 1e 3c 3b 13 ac b9 f3 1b b6 0b \
  bc bc 19 ec c2 38 9c c3 3a bc 40 5b 12 c3 e4 9b \
  bc e7 6b c3 0d bc c3 44 5c c4 2a 2c be fc 5b c1 \
  25 5c bf 37 6c c4 4e fc c4 2b 00 bf 49 4c c2 e6 \
  9b bd 42 8c c2 14 00 c5 5a 6c c4 07 7c ba 9b 8b \
  bd 35 8c c1 bd bb c5 64 6c c4 ad e5 c5 33 fc bf \
  0c 8c c2 65 dc c6 45 5c bd f2 5b be 9c 1b c4 62 \
  1c c0 6e fc c1 65 98 c7 7a bc c7 7c 9c c7 23 8c \
  ba 73 6c c5 75 ec 29 7d 5c c8 86 7c c8 88 9c c8 \
  7a 4c c1 54 1c c8 61 7c c2 9d a2 c8 92 3c c9 94 \
  2c c9 09 5c c5 8f 4c b6 9c 52 c9 9c dc c9 9e 9c \
  c7 5f 4c bf 82 7b 35 9f 5c ca a6 fc c9 4b 2c b8 \
  a7 bc ca ac fc c9 6a fe dc 66 ad 1c cb b2 3c cb \
  b4 ec c9 f0 73 cb b8 9c cb ba bc cb bc dc cb be \
  fc cb c0 1c cc c2 3c cc c4 5c cc c6 7c cc c8 9c \
  cc ca bc cc cc dc cc ce fc cc d0 1c cd d2 3c cd \
  d4 5c cd d6 7c cd d8 9c cd da bc cd dc dc cd de \
  ac cd c2 13 ce e2 3c ce e4 5c ce e4 7c 26 e6 9c \
  ce ea bc ce ec dc ce ee 6c 02 43 31 15 45 71 1a \
  ee 51 20 cf a2 28 a3 f2 ce fa bc cf fc ac cf f1 \
  bc 16 b7 91 21 62 92 2b 51 c2 2f fd 7c d0 08 9d \
  d0 ac 23 cf 93 51 cf 89 82 cf 29 a3 d0 12 3d d1 \
  ec fc 15 76 61 1c 02 7d 27 78 02 d1 41 43 d1 1e \
  fd d1 e1 0c d0 18 dd 23 1b ed 85 e9 02 d2 28 ed \
  d1 17 8d 1a 19 6d cf 3f c2 d1 39 98 d2 32 ad d0 \
  f3 1c d0 24 4d d0 30 3d 40 33 bd d3 e3 0c 59 3e \
  fd 37 0d 2d 20 4f 52 d2 5b 93 2e 3f 7d d4 48 9d \
  d4 4a bd d4 4c dd d4 4a 4d cf 42 3d d0 f7 6c d2 \
  69 e2 d4 56 7d d5 fe 58 9d d5 4c 6d d3 43 8d d3 \
  54 ad d5 60 1d d6 62 dd d4 23 dd d5 53 bd 35 63 \
  9d d6 6a bd d6 25 c0 d2 37 7d d6 d1 c2 d6 72 3d \
  d7 58 ed d0 44 bd 2b 74 9d d7 7a ad d4 51 ad d1 \
  5e 2d 24 7b 1d d8 82 4d 39 2d fd d0 7a 32 d8 88 \
  0d d6 62 b3 d8 8b fd d6 2f ad 27 8c 1d d9 92 3d \
  d9 94 5d d9 96 7d d9 98 9d d9 8c 6d d6 8f 2d 24 \
  9a fd d9 a0 1d da a2 3d da 22 20 d5 9d 6d 26 a4 \
  9d da aa bd da a1 ed d7 70 7d 01 ac 1d db b2 3d \
  db 62 e3 d2 e6 82 da b4 9d db ba 3d da 86 ed d9 \
  bb fd db c0 7d d9 77 0d db c1 5d dc c6 bd d8 7f \
  bd 2b c7 bd dc aa 0d 36 ce ed dc af 7d 01 cf 3d \
  dd d4 5d dd d6 7d dd d8 9d dd da bd dd d9 7d da \
  67 b2 dd 1f 98 3a 90 45 5f 26 89 62 f5 33 bb 08 \
  c0 dd ea bd de ce 7d db df cd de e2 4d 5a 31 68 \
  de 0b b9 1d f0 7d df db 5d d0 ef bd de 70 25 5e \
  a5 15 8e c6 74 fe de 07 86 df 04 7e dd 39 cd de \
  fd 4d de 00 fe ba f5 8d 1e 05 fe e0 d3 6d d2 08 \
  0e 81 fe 3d df f8 24 e0 6a 87 16 10 be e1 2e 53 \
  d4 19 c0 df 14 ae e0 ac 88 e1 00 e7 00 1c ce e1 \
  78 d3 27 ea 9d e0 92 b5 e0 06 85 de dc 71 e2 d9 \
  ed 81 34 0e 30 8f 53 e3 38 ae 7f f2 ed 87 f4 5d \
  b9 9b 93 e3 40 1e e4 42 3e e4 fa 67 3a 44 0e e4 \
  2d 3e e2 0d fe 1b 47 de e4 4e 7e e4 0b f8 e4 39 \
  ce e3 17 be e4 53 2a e5 58 9e e5 45 de 2f 5a 5e \
  e3 4a ee e3 08 d0 e5 62 8e e5 03 34 e6 34 de e3 \
  a3 6b e6 6a de e4 2a 93 84 6a ee 4e 24 3e 29 6b \
  3e e7 43 ce 43 31 49 e7 0c ee e3 74 4e e3 72 ec \
  02 44 be 2e 80 0e e8 54 14 e8 84 5e e8 86 4e e8 \
  a3 34 ba 87 be e8 8c be 2e 20 da e8 90 de 01 3a \
  18 e9 94 be 2e 71 6e 1f 95 9e e9 d6 02 b5 30 a0 \
  e9 86 ae 88 9e 1e e9 56 1e ea 99 ee 61 4b 45 ea \
  81 0e 8d a8 fe de e8 b3 bb ea 91 9e 66 a0 e5 ea \
  84 0e 30 b2 7e e8 c8 53 eb 8d 8e bd b8 0e 7f bb \
  5e e8 5f d4 eb 87 ee a4 31 d0 eb 04 08 ec 81 3e \
  47 c6 5e e8 61 6b 52 bb ee 82 c9 be 2e 59 f2 ec \
  84 ae 68 90 4e 2d d6 6e ed d1 78 ed da be ed dc \
  ae ed cc d1 ed e0 1e ee db de b1 e2 5e ee 1a b0 \
  89 20 60 ee ea 7e ed 08 b3 ee ee 6e ed 1d 1b 03 \
  ef ce ed fb 17 36 f3 be ee 9b 73 ef ef 2e b6 8b \
  a6 ef d7 1e de 1b e5 ef e2 0e 2b 02 af ee 13 6b \
  6b 05 ef 2b ce fd 53 09 cf ed 60 d4 f0 e1 7e f0 \
  bd 04 f1 0e 05 59 10 7f ed 5a 72 f1 dd 9e 52 be \
  44 f1 02 35 de ac a3 f1 a6 92 24 22 7f ed 12 cf \
  58 1e cf e2 e3 e5 e2 89 2e 6f 9c d3 c5 8c ec 62 \
  b0 1e ef 7b 55 ee a4 72 f3 2a ae f2 ff fd e5 30 \
  8e 60 30 8f 9e 32 8f bd 1c af 65 38 5f f4 46 df \
  28 3a 6f e1 70 6e e5 d5 b5 24 67 1c f3 a1 2c b4 \
  bb 4b 02 fe 47 5f f5 38 1f e2 49 2e 87 97 ae 5a \
  4e 9f 9b 50 3f bf 52 df 59 56 63 f5 64 df 27 20 \
  bf f2 3c ef f2 30 0c 9b 23 1c f4 c2 6e c2 b8 56 \
  f6 65 bf e3 e5 5d e5 60 8e 5e c9 f2 f4 40 1f f5 \
  34 af 65 58 23 f7 64 bf 5b 3b af f5 4c 8f f7 5d \
  df b5 5f df e7 cb 0e f7 00 bb 01 80 6f f5 3e 38 \
  f8 17 b6 f5 51 36 3e 7a 6f 3e 6e bf f8 f5 ea 68 \
  8f 5f f5 15 4e e5 4b 7f f7 3d 66 f9 5e bf f7 60 \
  df f7 7d c6 6c 65 bf 82 ac 8f ce 59 3f f9 85 3f \
  fa 3f 8f f9 7c cf ef 62 df 6d ad 9f fb ba bf 27 \
  af 8f e6 6a 2f 99 6c 8f c0 ec 05 a2 61 ef f7 05 \
  b7 fb c8 df fa 68 4f f8 a2 ef f3 c1 ef b5 99 5f \
  fc a9 9f be c9 5f fd e8 ac f4 01 1e fb ce 6f bb \
  c2 cf 61 8a 2f fd 9b b6 bd d6 6f fd d8 9f e7 3d \
  4f 4b b3 ff 3c d1 8f fa e1 9f c1 0f 30 fe d5 0f \
  fa d9 df fc e8 ff fc 89 4f fc ec af 6e 8f e6 18 \
  f0 9f fe fc 75 1f fa 40 60 10 0a 0f c5 03 02 c9 \
  50 32 1c 4d 47 04 1a a9 4c 31 55 0c 07 8b 0d 6d \
  43 23 ef 09 7c 6a 8d 5b 2e 33 0c 0d 8b ad d7 2f \
  f7 8b 15 27 cd 49 1b fb 86 92 7f ec 2f 7d ff 1f \
  30 50 50 85 50 65 e5 70 25 45 51 d1 c3 63 88 c8 \
  08 09 61 89 c9 29 4a 8a ca 2a 4b 8b cb 6b 24 4c \
  8c cc cc 25 4d 8d 2d e6 0d 4e 8e ee 0e 4f 6f ef \
  41 50 d0 82 b6 d6 d6 b6 10 31 71 31 a5 f1 d1 c0 \
  e8 28 69 c9 e9 29 6a aa c2 ea 6a 93 ab eb 2b 8c \
  ac ec 2c ed 14 f5 2d 8e 85 ae ee 2e 8f 02 f6 a1 \
  e0 56 7c 9c 9c 96 50 97 b7 d7 f1 31 58 92 b2 f8 \
  12 59 79 93 a3 d9 13 34 7a b4 b4 3a 15 5b bb b5 \
  db b7 02 e1 ca 15 24 67 08 51 3a 5f ec 22 0d 53 \
  02 ef 58 a6 2a f4 ec 3d 03 93 6f 1a 1a 7e d7 56 \
  cd 01 f8 6a cf 40 82 06 49 d6 42 c7 6b e1 90 76 \
  0e 2b 35 89 27 71 59 96 8a 9f a0 89 ca 68 8a 4d \
  bf fe 8e db ec 04 84 25 72 64 49 92 09 51 ae 53 \
  d9 70 12 31 4b 11 93 69 62 d6 c9 62 a8 31 fa a8 \
  9d d2 99 8d 15 37 90 e0 44 12 10 2a f4 90 42 a3 \
  90 8a b8 53 ea 92 e9 bc a7 5b ee d5 9c 7a 73 a3 \
  1b 7f 59 7b 6e 05 4a c0 eb d7 a1 62 7f ad 4c fa \
  70 29 14 79 4e 65 42 a5 79 d1 26 a9 aa 39 39 62 \
  f5 a8 d5 db cf ae 78 f5 92 e4 cb b0 2c 4b 88 82 \
  61 52 34 8c 2f f1 3e ab 8d ff 41 16 38 99 72 c9 \
  09 ab 59 b7 6e 5d f4 91 6b d9 b3 69 d7 b6 7d 1b \
  37 6e ae 03 f1 f6 ce fd 7b c2 a2 94 06 80 17 37 \
  7e bc 38 6a bc 03 90 d7 66 34 b6 79 74 e9 d1 0b \
  f4 5e ce 7c fa eb e1 c4 b3 77 f7 4e db 3a 81 01 \
  e3 bf 4f d8 7e a0 7c fa ef d6 c7 0f 10 50 7e 2c \
  30 f5 f3 bb 5f 77 ff fe 7b 5f f4 f4 f9 37 17 3f \
  5e 80 00 7f 93 80 c0 02 0d 34 10 b3 03 15 5c 90 \
  c1 06 1d 7c 10 c2 08 0f 6c 2f c0 00 25 94 f0 a8 \
  fe 22 2e dc 90 c3 0e 3d 94 00 c0 0a 03 f8 90 41 \
  b2 8e 20 11 c5 14 3f bc 2f c0 00 46 54 b1 40 60 \
  1a 82 91 c6 1a 19 ac 50 00 17 5f a4 d1 2f 1b 7d \
  f4 51 44 1d 6d 44 8a 81 1f 8d 84 b1 45 1d 01 18 \
  52 98 a4 8e 7c 92 c4 1c 95 5c 12 ca 2a ad b4 12 \
  82 2c b5 dc 92 cb 2e bd fc 12 cc 30 c5 1c 93 cc \
  32 cd 3c 13 cd 34 d5 5c 93 cd 36 dd 7c 13 ce 38 \
  e5 9c 93 ce 3a ed bc 13 cf 3c f5 dc 93 cf 3e fd \
  fc 13 d0 40 05 1d 34 cf 06 0c 3d 14 d1 44 15 5d \
  94 d1 46 1d 7d 14 d2 48 25 9d 94 d2 4a 2d bd 14 \
  d3 4c 35 dd 94 d3 4e 3d fd 14 d4 50 45 1d 95 d4 \
  52 4d 3d 15 d5 54 55 5d 95 d5 56 5d 7d 15 56 53 \
  17 98 95 d6 5a 6d bd 15 d7 5c 75 dd 95 d7 5e 7d \
  fd 15 d8 60 85 1d 96 d8 62 8d 3d 16 d9 64 95 5d \
  96 d9 66 9d 7d 16 da 68 a5 9d 96 da 6a ad bd 16 \
  db 6c b5 dd 96 db 6e a7 55 00 dc 70 c5 1d 97 6c \
  dc 72 cd 3d 17 dd 74 d5 5d 97 dd 76 dd 7d 17 de \
  78 e5 9d 97 de 7a ed bd 17 df 7c f5 dd 97 df 7e \
  fd fd 17 e0 80 05 1e 98 e0 82 0d 3e 18 e1 84 15 \
  06 38 81 86 1d 7e 18 e2 88 25 9e 98 e2 8a 2d be \
  18 e3 8c 35 de 98 e3 8e 3d fe 18 e4 90 45 1e 99 \
  e4 92 4d 3e 19 e5 94 55 5e 99 e5 96 5d 7e 19 e6 \
  98 65 9e 99 e6 9a 6d be b9 e5 20 00 00 3b"



radio=0
radiotarget = FXDataTarget(radio,None,0)

# Make application
application = FXApp("Groupbox","FoxTest")

# Make icon
wizardimage2 = bytes.fromhex(wizardimage)
image = FXGIFImage(application,wizardimage2,IMAGE_KEEP)

# Make wizard
wizard = FXWizard(application,"Name",image,DECOR_TITLE|DECOR_BORDER)

# Pane #1
pane1 = FXVerticalFrame(wizard.getContainer(),LAYOUT_FILL_Y|LAYOUT_FILL_X,0,0,0,0, 0,0,0,0)
gp = FXGroupBox(pane1,"Group Box",LAYOUT_FILL_Y|FRAME_GROOVE|LAYOUT_FILL_X,0,0,0,0, 0,0,0,0)
FXRadioButton(gp,"Button &1",radiotarget,FXDataTarget.ID_OPTION+0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP)
FXRadioButton(gp,"Button &2",radiotarget,FXDataTarget.ID_OPTION+1,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP)
FXRadioButton(gp,"Button &2",radiotarget,FXDataTarget.ID_OPTION+2,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP)
FXRadioButton(gp,"Button &4",radiotarget,FXDataTarget.ID_OPTION+3,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP)

# Pane #2
pane2 = FXVerticalFrame(wizard.getContainer(),LAYOUT_FILL_Y|LAYOUT_FILL_X,0,0,0,0, 0,0,0,0)
FXLabel(pane2,"Enter some text:")
textbox = FXVerticalFrame(pane2,LAYOUT_FILL_X|LAYOUT_FILL_Y|FRAME_SUNKEN|FRAME_THICK,0,0,0,0, 0,0,0,0)
text = FXText(textbox,None,0,TEXT_SHOWACTIVE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
text.setVisibleColumns(60)

# Pane #3
pane3 = FXVerticalFrame(wizard.getContainer(),LAYOUT_FILL_Y|LAYOUT_FILL_X,0,0,0,0, 0,0,0,0)
FXLabel(pane3,"Pick a file:")
filebox = FXVerticalFrame(pane3,LAYOUT_FILL_X|LAYOUT_FILL_Y|FRAME_SUNKEN|FRAME_THICK,0,0,0,0, 0,0,0,0)
filelist = FXFileList(filebox,None,0,ICONLIST_MINI_ICONS|ICONLIST_AUTOSIZE|LAYOUT_FILL_X|LAYOUT_FILL_Y)
filelist.setDirectory(os.getcwd())


# Run
application.create()

wizard.execute(PLACEMENT_SCREEN)
