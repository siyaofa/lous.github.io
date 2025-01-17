from tensorflow.keras import layers
from tensorflow.keras import models
from tensorflow.keras.layers import Conv2D,MaxPooling2D,Flatten,Dense,Dropout

def get_model(image_size,class_num):
	model = models.Sequential()
	model.add(Conv2D(32, (3, 3), activation='relu',
							input_shape=(image_size[0], image_size[1], 3)))
	model.add(MaxPooling2D((2, 2)))
	model.add(Dropout(0.2))
	model.add(Conv2D(64, (3, 3), activation='relu'))
	model.add(MaxPooling2D((2, 2)))
	model.add(Dropout(0.2))
	model.add(Conv2D(128, (3, 3), activation='relu'))
	model.add(MaxPooling2D((2, 2)))
	model.add(Dropout(0.2))
	model.add(Conv2D(128, (3, 3), activation='relu'))
	model.add(MaxPooling2D((2, 2)))
	model.add(Dropout(0.2))
	model.add(Flatten())
	model.add(Dropout(0.2))
	model.add(Dense(64, activation='relu'))
	model.add(Dropout(0.2))
	model.add(Dense(36, activation='relu'))
	model.add(Dense(class_num, activation='softmax'))
	#model.add(layers.Dense(3, activation='relu'))
	model.summary()
	model.compile(optimizer='adam',
				  loss='binary_crossentropy',
				  metrics=['accuracy'])
	return model
