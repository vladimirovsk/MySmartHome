import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const PORT = 8000

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  app.enableCors();
  await app.listen(PORT);
}

bootstrap()
    .then(r => {console.log(`Start server port: ${PORT}`)})
    .catch(err=> {console.error(`Error start server in port: ${PORT}`)})
